{ ... }: {
  imports = [
    ./chromium.nix
    ./firefox.nix
  ];

  home-manager.users.dmanik.home.sessionVariables.BROWSER = "chromium";
}
