{ config, pkgs, inputs, ... }:
{
  home.sessionVariables.EDITOR = "emacs";

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ epkgs.vterm ];
  };

  home.packages = with pkgs; [
    ripgrep
  ];
}
