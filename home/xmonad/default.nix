{ pkgs, ... }: {
  xsession = {
    enable = true;
    pointerCursor = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 32;
    };
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ./xmonad-config.hs;
    };
  };

  programs.xmobar = {
    enable = true;
    extraConfig = builtins.readFile ./xmobarrc;
  };

  home.packages = with pkgs; [
    feh
    xorg.xrandr
  ];
}
