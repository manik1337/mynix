{ pkgs, ... }: {
  programs.mako = {
    enable = true;

    defaultTimeout = 10000;
    ignoreTimeout = true;
    font = "Hack Nerd Font 12";
  };
}
