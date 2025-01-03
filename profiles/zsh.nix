{
  home-manager.users.dmanik.programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    shellAliases = {
      v = "nvim";
      c = "clear";
      unziptar = "tar -xvzf";
      mkdir = "mkdir -vp";
      rm = "rm -rifv";
      mv = "mv -iv";
      cp = "cp -riv";
      fzf = "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'";
      tree = "eza --tree --icons";
      lg = "lazygit";
      k = "kubectl";
    };
    oh-my-zsh = {
      enable = true;
      theme = "lambda";
      plugins = [ "git" ];
    };
  };
}
