{ pkgs, ... }:

{
  services = {
    dunst = {
      enable = true;
      iconTheme = {
        name = "Adwaita";
        package = pkgs.gnome3.adwaita-icon-theme;
        size = "16x16";
      };
      settings = {
        global = {
          geometry = "300x25-50+65";
          shrink = "yes";
          transparency = 10;
          padding = 16;
          horizontal_padding = 16;
          font = "JetBrains Mono 12";
          line_height = 2;
          format = "<b>%s</b>\\n%b";
        };
      };
    };
  };
}
