{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "alacritty";
    extraConfig.matching = "fuzzy";
 };
}
