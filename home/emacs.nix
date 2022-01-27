{ config, pkgs, inputs, ... }:
{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ epkgs.vterm ];
  };

  home.packages = with pkgs; [
    ripgrep
  ];
}
