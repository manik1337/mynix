{
  home-manager.users.dmanik = {
    home.sessionVariables.TERMINAL = "alacritty";

    programs.alacritty = {
      enable = true;
      settings = {
        scrolling = {
          history = 100000;
          multiplier = 5;
        };
        font = {
          normal.family = "JetBrainsMono Nerd Font";
          size = 12;
        };
        window = {
          dynamic_title = true;
          opacity = 0.95;
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
