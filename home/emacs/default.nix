{ pkgs, ... }:
let
  emacsWithPackages = 
    (pkgs.emacsWithPackagesFromUsePackage {
      config = ./init.el;
      # package = pkgs.emacsPgtkNativeComp;
      alwaysEnsure = true;
      extraEmacsPackages = epkgs: with epkgs; [ all-the-icons vterm ];
    });
in {
  home.packages = [ emacsWithPackages ];
  home.file.".emacs.d/init.el".source = ./init.el;
  services.emacs = {
    enable = true;
    package = emacsWithPackages;
    defaultEditor = true;
  };
}
