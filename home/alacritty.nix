{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      scrolling = {
        history = 10000;
        multiplier = 30;
      };
      font = {
        normal.family = "Hack";
        size = 10;
      };
      background_opacity = 0.95;
      selection.save_to_clipboard = true;
      cursor.style = "Block";
      cursor.unfocused_hollow = true;
      url.launcher.program = "chromium";
      colors = {
        primary = {
          background = "0x181818";
          foreground = "0xd8d8d8";
        };

        cursor = {
          text   = "0x181818";
          cursor = "0xd8d8d8";
        };

        normal = {
          black =   "0x181818";
          red =     "0xab4642";
          green =   "0xa1b56c";
          yellow =  "0xf7ca88";
          blue =    "0x7cafc2";
          magenta = "0xba8baf";
          cyan =    "0x86c1b9";
          white =   "0xd8d8d8";
        };
  # Bright colors
        bright = {
          black =   "0x585858";
          red =     "0xdc9656";
          green =   "0x282828";
          yellow =  "0x383838";
          blue =    "0xb8b8b8";
          magenta = "0xe8e8e8";
          cyan =    "0xa16946";
        };
      };
      # colors = {
      #   primary = {
      #     background = "0x2E3440";
      #     foreground = "0xD8DEE9";
      #   };
      #   normal = {
      #     black = "0x3B4252";
      #     red = "0xBF616A";
      #     green = "0xA3BE8C";
      #     yellow = "0xEBCB8B";
      #     blue = "0x81A1C1";
      #     magenta = "0xB48EAD";
      #     cyan = "0x88C0D0";
      #     white = "0xE5E9F0";
      #   };
      #   bright = {
      #     black = "0x4C566A";
      #     red = "0xBF616A";
      #     green = "0xA3BE8C";
      #     yellow = "0xEBCB8B";
      #     blue = "0x81A1C1";
      #     magenta = "0xB48EAD";
      #     cyan = "0x8FBCBB";
      #     white = "0xECEFF4";
      #   };
      # };
      env = { TERM = "xterm-256color"; };
    };
  };
}
