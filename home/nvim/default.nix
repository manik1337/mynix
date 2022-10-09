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
      neogit

      # File tree
      nvim-web-devicons
      nvim-tree-lua

      # Languages
      vim-erlang-runtime
      vim-nix
      rust-tools-nvim

      # Eyecandy 
      base16-vim
      nvim-treesitter
      lualine-nvim
      lualine-lsp-progress
      tabline-nvim

      # Telescope
      telescope-nvim
      telescope-fzf-native-nvim

      # Indent lines
      indent-blankline-nvim

      # Editing
      comment-nvim
    ];
    extraConfig = ''
      lua << EOF
      ${lib.strings.fileContents ./lua/lsp.lua}
      ${lib.strings.fileContents ./lua/nvim-tree.lua}
      ${lib.strings.fileContents ./lua/settings.lua}
      ${lib.strings.fileContents ./lua/treesitter.lua}
      ${lib.strings.fileContents ./lua/telescope.lua}
      ${lib.strings.fileContents ./lua/neogit.lua}
      ${lib.strings.fileContents ./lua/lualine.lua}
      ${lib.strings.fileContents ./lua/tabline.lua}
      ${lib.strings.fileContents ./lua/comment.lua}
      EOF
    '';
  };

  home.packages = with pkgs; [ ripgrep ];
}
