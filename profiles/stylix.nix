{ pkgs, inputs, ... }:
{
  stylix = {
    enable = true;
    image = builtins.fetchurl {
      name = "wallpaper";
      url = "https://unsplash.com/photos/IRXYNAMlUtw/download\?ixid\=M3wxMjA3fDB8MXxzZWFyY2h8MTB8fG5ldyUyMHlvcmslMjBuaWdodHxlbnwwfDB8fHwxNzM5NzMwODUyfDI\&force\=true\&w\=2400";
      sha256 = "1lbpwmmrvc1391mngr12mnjm23g8g7pxqyp16dm0sijan2b9mr86";
    };
    base16Scheme = inputs.tt-schemes + "/base16/darcula.yaml";
    cursor = {
      name = "capitaine-cursors-white";
      package = pkgs.capitaine-cursors;
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font";
      };
      sizes = {
        desktop = 10;
        applications = 10;
        terminal = 10;
        popups = 10;
      };
      emoji = {
        package = pkgs.twemoji-color-font;
        name = "Twitter Color Emoji";
      };
    };
    polarity = "dark";
  };
}
