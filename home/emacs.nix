{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-doom-emacs.hmModule
  ];

  home.sessionVariables.EDITOR = "emacs";
  programs.doom-emacs = {
    enable = true;
    emacsPackagesOverlay = self: super: {
      lsp-mode = super.lsp-mode.overrideAttrs (esuper: {
        buildInputs = esuper.buildInputs ++ [ pkgs.erlang-ls ];
      });
    };
  };

  home.packages = with pkgs; [
    git
    ripgrep
    fd
    coreutils
    # clang
  ];
}
