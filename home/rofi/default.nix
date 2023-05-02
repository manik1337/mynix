{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    location = "center";
    extraConfig = {
      font = "Hack Nerd Font 12";
      show-icons = true;
      modi = "run,drun,ssh,filebrowser,window";
    };
    theme = ./catppuccin-theme.rasi;
  };
}
