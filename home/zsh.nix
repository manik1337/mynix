{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      v = "nvim";
      c = "clear";
      unziptar = "tar -xvzf";
      mkdir = "mkdir -vp";
      rm = "rm -rifv";
      mv = "mv -iv";
      cp = "cp -riv";
      cat = "bat --paging=never --style=plain";
      fzf =
        "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'";
      ls = "exa --icons";
      tree = "exa --tree --icons";
    };
    oh-my-zsh = {
      enable = true;
      theme = "lambda";
      plugins = [ "git" "sudo" ];
    };
  };
}
