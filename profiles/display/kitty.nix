{
  home-manager.users.dmanik = {
    home.sessionVariables.TERMINAL = "kitty";

    programs.kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 14;
      };
      settings = {
        scrollback_lines = 10000;
        enable_audio_bell = false;
      };
    };
  };
}
