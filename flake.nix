{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:rycee/home-manager";
    nur.url = "github:nix-community/NUR";
    foundry.url = "github:shazow/foundry.nix/monthly";
  };

  outputs = inputs@{ self, home-manager, nixpkgs, ... }:
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
      mkComputer = configurationNix: extraModules:
        nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          specialArgs = { inherit system inputs; };
          modules = ([
            configurationNix

            ({ pkgs, ... }: {
              nix = {
                package = pkgs.nixUnstable;
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
    in { nixosConfigurations.zionpad = mkComputer ./hosts/zionpad.nix [ ]; };
}
