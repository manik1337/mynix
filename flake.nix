{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:rycee/home-manager";
    nur.url = "github:nix-community/NUR";
    foundry.url = "github:shazow/foundry.nix";
    deploy-rs.url = "github:serokell/deploy-rs";
  };

  outputs = inputs@{ self, home-manager, nixpkgs, deploy-rs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (import ./overlays inputs system)
          inputs.nur.overlay
          inputs.foundry.overlay
        ];
      };
    in
    {
      nixosConfigurations = {
        v111 = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = {
            inherit system inputs;
          };
          modules = [
            ./machines/v111
          ];
        };
        zionpad =
          nixpkgs.lib.nixosSystem {
            inherit system pkgs;
            specialArgs = {
              inherit system inputs;
            };
            modules = (
              [
                ./machines/t14s

                (
                  { pkgs, ... }:
                  {
                    nix = {
                      package = pkgs.nixVersions.latest;
                      nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
                      registry.nixpkgs.flake = inputs.nixpkgs;
                      extraOptions = ''
                        experimental-features = nix-command flakes
                      '';
                    };
                  }
                )

                home-manager.nixosModules.home-manager
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.users.dmanik = import ./home/home.nix { inherit inputs system pkgs; };
                }
              ]
            );
          };
      };

      deploy = {
        sshUser = "root";
        nodes = {
          zionpad = {
            hostname = "localhost";
            profiles = {
              system = {
                user = "root";
                path = inputs.deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.zionpad;
              };
            };
          };
          v111 = {
            hostname = "107.191.44.103";
            profiles = {
              system = {
                user = "root";
                path = inputs.deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.v111;
              };
            };
          };
        };
      };
    };
}
