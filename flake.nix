{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:rycee/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    deploy-rs.url = "github:serokell/deploy-rs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tt-schemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      deploy-rs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      findModules =
        dir:
        let
          contents = builtins.readDir dir;
          processFile =
            name: type:
            if type == "regular" && nixpkgs.lib.hasSuffix ".nix" name then
              [
                {
                  name = nixpkgs.lib.removeSuffix ".nix" name;
                  value = dir + "/${name}";
                }
              ]
            else if type == "directory" && (builtins.readDir (dir + "/${name}")) ? "default.nix" then
              [
                {
                  inherit name;
                  value = dir + "/${name}";
                }
              ]
            else if type == "directory" then
              findModules (dir + "/${name}")
            else
              [ ];
        in
        builtins.concatLists (nixpkgs.lib.mapAttrsToList processFile contents);
    in
    {
      nixosModules = builtins.listToAttrs (findModules ./modules);
      nixosProfiles = builtins.listToAttrs (findModules ./profiles);
      nixosRoles = import ./roles;
      nixosConfigurations =
        let
          hosts = builtins.attrNames (builtins.readDir ./machines);
          mkHost =
            name:
            nixpkgs.lib.nixosSystem {
              inherit system;
              modules = [
                # Base configuration
                {
                  nixpkgs.pkgs = import nixpkgs {
                    inherit system;
                    overlays = [
                      (import ./overlays inputs system)
                      inputs.nur.overlays.default
                    ];
                    config.allowUnfree = true;
                    config.allowAliases = true;
                  };
                }
                { device = name; }

                # External modules
                inputs.home-manager.nixosModules.home-manager
                inputs.stylix.nixosModules.stylix

                # Machine-specific configuration
                (import (./machines + "/${name}"))
              ] ++ (builtins.attrValues self.nixosModules);
              specialArgs = {
                inherit inputs system;
              };
            };
        in
        nixpkgs.lib.genAttrs hosts mkHost;

      deploy = {
        sshUser = "root";
        nodes = nixpkgs.lib.mapAttrs (name: machine: {
          hostname = if name == "t14s" then "localhost" else "107.191.44.103";
          profiles.system = {
            user = "root";
            path = deploy-rs.lib.x86_64-linux.activate.nixos machine;
          };
        }) self.nixosConfigurations;
      };
    };
}
