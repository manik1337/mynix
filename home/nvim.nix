{ lib, pkgs, ... }:

{
  home.sessionVariables.EDITOR = "vim";
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      # Git
      vim-fugitive
      vim-flog

      # File tree
      nvim-web-devicons 
      nvim-tree-lua

      # Languages
      vim-erlang-runtime
      vim-nix

      # Eyecandy 
      gruvbox
      nvim-treesitter
      bufferline-nvim
      galaxyline-nvim
      nvim-colorizer-lua
      # dusk-vim
      pears-nvim

      # LSP and completion
      nvim-lspconfig
      nvim-cmp
      cmp-vsnip
      vim-vsnip

      # Telescope
      telescope-nvim

      # Indent lines
      indent-blankline-nvim
    ];      
    extraConfig =
      ''
        lua << EOF
        ${lib.strings.fileContents ./nvim/lua/nvim-tree.lua}
        ${lib.strings.fileContents ./nvim/lua/settings.lua}
        EOF
      '';
  };
}
