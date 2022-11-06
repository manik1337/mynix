{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:rycee/home-manager";
    nur.url = "github:nix-community/NUR";
    deploy-rs.url = "github:serokell/deploy-rs";
  };

  outputs =
    inputs@{ self, home-manager, nixpkgs, deploy-rs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays =
          [ (import ./overlays) inputs.nur.overlay ];
      };
      mkComputer = configurationNix: extraModules:
        nixpkgs.lib.nixosSystem {
          inherit system pkgs;

          specialArgs = { inherit system inputs; };
          modules = ([
            configurationNix

            ({ pkgs, ... }: {
              nix = {
                package =  pkgs.nixUnstable;
                nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
                registry.nixpkgs.flake = inputs.nixpkgs;
                extraOptions = ''
                  experimental-features = nix-command flakes
                '';
              };
            })

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.dmanik =
                import ./home/home.nix { inherit inputs system pkgs; };
            }
          ] ++ extraModules);
        };
    in {
      nixosConfigurations = { zion2 = mkComputer ./hosts/zion2.nix [ ]; };
      deploy = {
        sshUser = "root";
        nodes = {
          zion2 = {
            hostname = "localhost";
            profiles.system = {
              user = "root";
              path = deploy-rs.lib.x86_64-linux.activate.nixos
                self.nixosConfigurations.zion2;
            };
          };
        };
      };
      checks = builtins.mapAttrs
        (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
