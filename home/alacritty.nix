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
        size = 11;
      };
      window.opacity = 0.95;
      selection.save_to_clipboard = true;
      custom_cursor_colors = true;
      cursor = {
        style = "Block";
        unfocused_hollow = true;
      };
      url.launcher.program = "chromium";
      colors = {
        primary = {
          background = "0x1d1f21";
          foreground = "0xc5c8c6";
        };

        # Colors the cursor will use if `custom_cursor_colors` is true
        cursor = {
          text = "0x1d1f21";
          cursor = "0xc5c8c6";
        };

        # Normal colors
        normal = {
          black = "0x1d1f21";
          red = "0xcc6666";
          green = "0xb5bd68";
          yellow = "0xf0c674";
          blue = "0x81a2be";
          magenta = "0xb294bb";
          cyan = "0x8abeb7";
          white = "0xc5c8c6";
        };

        # Bright colors
        bright = {
          black = "0x969896";
          red = "0xcc6666";
          green = "0xb5bd68";
          yellow = "0xf0c674";
          blue = "0x81a2be";
          magenta = "0xb294bb";
          cyan = "0x8abeb7";
          white = "0xffffff";
        };
        env = {
          TERM = "xterm-256color";
        };
      };
    };
  };
}
