{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:rycee/home-manager";
    nur.url = "github:nix-community/NUR";
    deploy-rs.url = "github:serokell/deploy-rs";
  };

  outputs = inputs@{ self, home-manager, nixpkgs, deploy-rs, ... }:
    let
      system = "x86_64-linux";
      lib = inputs.nixpkgs.lib;

      findModules = dir:
        builtins.concatLists (builtins.attrValues (builtins.mapAttrs
          (name: type:
            if type == "regular" then [{
              name = builtins.elemAt (builtins.match "(.*)\\.nix" name) 0;
              value = dir + "/${name}";
            }] else if (builtins.readDir (dir + "/${name}")) ? "default.nix" then [{
              inherit name;
              value = dir + "/${name}";
            }] else findModules (dir + "/${name}"))
          (builtins.readDir dir)
        ));
    in
    {
      nixosModules = builtins.listToAttrs (findModules ./modules);
      nixosProfiles = builtins.listToAttrs (findModules ./profiles);
      nixosRoles = import ./roles;
      nixosConfigurations =
        let
          hosts = builtins.attrNames (builtins.readDir ./machines);
          mkHost = name:
            lib.nixosSystem {
              inherit system;
              modules = builtins.attrValues self.nixosModules ++ [
                inputs.home-manager.nixosModules.home-manager

                (import (./machines + "/${name}"))
                {
                  nixpkgs = {
                    pkgs = import inputs.nixpkgs
                      {
                        overlays = [ self.orly inputs.nur.overlay ];
                        localSystem = { inherit system; };
                        config.allowUnfree = true;
                      };
                  };
                }
                { device = name; }
              ];
              specialArgs = { inherit inputs; };
            };
        in
        lib.genAttrs hosts mkHost;
      orly = import ./overlays inputs;

      deploy = {
        sshUser = "root";
        nodes = (builtins.mapAttrs
          (name: machine:
            {
              hostname = if name == "t14s" then "localhost" else "127.0.0.1";
              profiles.system = {
                user = "root";
                path = deploy-rs.lib.${machine.pkgs.system}.activate.nixos machine;
              };
            })
          self.nixosConfigurations);
      };
    };
}

