{ pkgs, ... }: {
  xsession = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ./xmonad-config.hs;
      libFiles = {
        "Nord.hs" = pkgs.writeText "Nord.hs" ''
          module Nord where
          
          import XMonad
          
          colorScheme = "nord"
          
          colorBack = "#2E3440"
          colorFore = "#D8DEE9"
          
          color01 = "#343d46"
          color02 = "#EC5f67"
          color03 = "#99C794"
          color04 = "#FAC863"
          color05 = "#6699cc"
          color06 = "#c594c5"
          color07 = "#5fb3b3"
          color08 = "#d8dee9"
          color09 = "#343d46"
          color10 = "#EC5f67"
          color11 = "#99C794"
          color12 = "#FAC863"
          color13 = "#6699cc"
          color14 = "#c594c5"
          color15 = "#5fb3b3"
          color16 = "#d8dee9"
          
          colorTrayer :: String
          colorTrayer = "--tint 0x2E3440"
        '';
      };
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
