{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    historyLimit = 20000;
    escapeTime = 0;
    prefix = "C-a";
    terminal = "xterm-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = ''
      bind-key -r f run-shell "tmux neww tms"\n
    '';
  };

  home.packages = with pkgs; [ tmux-sessionizer ];
}
