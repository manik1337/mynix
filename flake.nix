{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    home-manager.url = "github:nix-community/home-manager";
    nur.url = "github:nix-community/NUR";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = inputs@{ self, home-manager, nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [ (import ./overlays/dwm.nix) inputs.nur.overlay ];
    };
    mkComputer = configurationNix: extraModules: nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      specialArgs = { inherit system inputs; };
      modules = (
        [
          configurationNix

          ({ pkgs, ... }: {
            nix = {
              package = pkgs.nixFlakes;
              extraOptions = ''
                experimental-features = nix-command flakes
              '';
            };
          })

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.dmanik = import ./home/home.nix
            {
              inherit inputs system pkgs;
            };
          }
        ] ++ extraModules
      );
    };
  in
  {
    nixosConfigurations = {
      zion = mkComputer ./hosts/zion.nix [];
    };
  };
}
