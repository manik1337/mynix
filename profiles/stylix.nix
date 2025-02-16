{ pkgs, inputs, ... }:
{
  stylix = {
    enable = true;
    image = builtins.fetchurl {
      name = "wallpaper";
      url = "https://unsplash.com/photos/Y3PD_9c2xms/download?ixid=M3wxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNzM5MzAxNDE2fA&force=true";
      sha256 = "1knl379zjs06zb22xwxh7ax1rfq4wf9pn4yis5jdrililn7hks73";
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
