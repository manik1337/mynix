{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    historyLimit = 20000;
    shell = "${pkgs.zsh}/bin/zsh";
  };
}
