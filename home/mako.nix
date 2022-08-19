{ pkgs, ... }: {
  programs.mako = {
    enable = true;

    defaultTimeout = 10000;
    ignoreTimeout = true;
    font = "IBM Plex Serif 12";
  };
}
