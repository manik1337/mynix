{
  home-manager.users.dmanik.programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    zsh.enable = true;
  };
}
