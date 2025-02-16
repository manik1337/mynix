{
  home-manager.users.dmanik.programs.tmux = {
    enable = true;
    escapeTime = 0;
    historyLimit = 10000;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    terminal = "screen-256color";
  };
}
