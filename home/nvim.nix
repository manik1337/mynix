{ lib, pkgs, ... }:

{
  home.sessionVariables.EDITOR = "vim";
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # LSP
      nvim-lspconfig
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
      cmp-vsnip
      vim-vsnip

      # Git
      vim-fugitive
      vim-flog
      git-blame-nvim

      # File tree
      nvim-web-devicons 
      nvim-tree-lua

      # Languages
      vim-erlang-runtime
      vim-nix
      rust-tools-nvim

      # Eyecandy 
      gruvbox
      nvim-treesitter

      # Telescope
      telescope-nvim

      # Indent lines
      indent-blankline-nvim
    ];
    extraConfig =
      ''
        lua << EOF
        ${lib.strings.fileContents ./nvim/lua/lsp.lua}
        ${lib.strings.fileContents ./nvim/lua/nvim-tree.lua}
        ${lib.strings.fileContents ./nvim/lua/settings.lua}
        EOF
      '';
  };
}
