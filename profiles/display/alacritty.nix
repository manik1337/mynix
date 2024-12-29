{
  home-manager.users.dmanik = {
    programs.alacritty = {
      enable = true;
      settings = {
        env = {
          TERM = "xterm-256color";
        };
        scrolling = {
          history = 100000;
          multiplier = 5;
        };
        font = {
          normal.family = "Hack Nerd Font";
          size = 10;
        };
        window = {
          dynamic_title = true;
        };
        selection.save_to_clipboard = true;
        cursor = {
          style = {
            shape = "Block";
            blinking = "Always";
          };
          blink_interval = 500;
        };
      };
    };
  };
}
