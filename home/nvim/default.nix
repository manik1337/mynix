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

      plenary-nvim

      # Git
      vim-fugitive
      vim-flog
      diffview-nvim
      gitsigns-nvim

      # File tree
      nvim-web-devicons
      nvim-tree-lua

      # Languages
      vim-erlang-runtime
      vim-nix
      rust-tools-nvim
      nvim-metals

      # Eyecandy
      catppuccin-nvim
      base16-vim
      material-nvim
      tokyonight-nvim

      (nvim-treesitter.withPlugins (plugins: with plugins; [
        nix lua scala javascript yaml python rust c erlang elixir kotlin go
      ]))
      nvim-treesitter-context

      lualine-nvim
      lualine-lsp-progress
      tabline-nvim

      # Telescope
      telescope-nvim
      telescope-fzf-native-nvim

      # Indent lines
      indent-blankline-nvim

      # Editing
      align
      comment-nvim
      copilot-vim
    ];
    extraConfig = ''
      lua << EOF
      ${lib.strings.fileContents ./lua/settings.lua}
      ${lib.strings.fileContents ./lua/meterial.lua}
      ${lib.strings.fileContents ./lua/nvim-tree.lua}
      ${lib.strings.fileContents ./lua/telescope.lua}
      ${lib.strings.fileContents ./lua/lualine.lua}
      ${lib.strings.fileContents ./lua/tabline.lua}
      ${lib.strings.fileContents ./lua/comment.lua}
      ${lib.strings.fileContents ./lua/treesitter.lua}
      ${lib.strings.fileContents ./lua/lsp.lua}
      ${lib.strings.fileContents ./lua/gitsigns.lua}
      ${lib.strings.fileContents ./lua/fugitive.lua}
      EOF
    '';
  };

  home.packages = with pkgs; [ ripgrep ];
}
