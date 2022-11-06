{ config, pkgs, ... }: {
  programs.swaylock.settings = {
    ignore-empty-password = true;
    show-keyboard-layout = true;
    indicator-caps-lock = true;
  };
}
