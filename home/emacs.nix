{ pkgs ? import <nixpkgs> { } }:

let
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesFor myEmacs).emacsWithPackages;
in emacsWithPackages (epkgs:
  (with epkgs.melpaPackages; [
    use-package

    magit
    vterm

    color-theme-sanityinc-tomorrow
    cyberpunk-theme
    doom-themes
    zenburn-theme
    jetbrains-darcula-theme
    base16-theme
    solarized-theme
    nord-theme

    projectile
    helm
    ag

    treemacs
    treemacs-evil
    treemacs-icons-dired
    treemacs-magit
    
    lsp-mode
    lsp-ui
    lsp-origami
    helm-lsp
    flycheck
    company
    yasnippet
    evil

    erlang
    haskell-mode
    solidity-mode
    go-mode
    python-mode
    elixir-mode
    
    rustic

    nix-mode
  ]))
