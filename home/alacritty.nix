{ pkgs, ... }:

{
  home.sessionVariables.TERMINAL = "alacritty";

  programs.alacritty = {
    enable = true;
    settings = {
      scrolling = {
        history = 10000;
        multiplier = 30;
      };
      font = {
        normal.family = "Hack Nerd Font";
        size = 12;
      };
      background_opacity = 0.95;
      selection.save_to_clipboard = true;
      cursor.style = "Block";
      cursor.unfocused_hollow = true;
      url.launcher.program = "firefox";

      colors = {
        primary = {
          background = "0x1a1b26";
          foreground = "0xa9b1d6";
        };

        normal = {
          black = "0x32344a";
          red = "0xf7768e";
          green = "0x9ece6a";
          yellow = "0xe0af68";
          blue = "0x7aa2f7";
          magenta = "0xad8ee6";
          cyan = "0x449dab";
          white = "0x787c99";
        };

        # Bright colors
        bright = {
          black = "0x444b6a";
          red = "0xff7a93";
          green = "0xb9f27c";
          yellow = "0xff9e64";
          blue = "0x7da6ff";
          magenta = "0xbb9af7";
          cyan = "0x0db9d7";
          white = "0xacb0d0";
        };
      };

      env = { TERM = "xterm-256color"; };
    };
  };
}
