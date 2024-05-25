{ pkgs, ... }: {
  home-manager.users.dmanik = {
    home.packages = with pkgs; [
      wine
      winetricks
      steam
      lutris
      vulkan-tools
    ];
  };
}
