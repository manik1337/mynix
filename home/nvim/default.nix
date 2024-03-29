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
      lsp-status-nvim

      plenary-nvim

      harpoon

      # Git
      vim-flog
      diffview-nvim
      gitsigns-nvim
      neogit

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
      kanagawa-nvim
      tender-vim
      everforest
      onedarkpro-nvim

      (nvim-treesitter.withPlugins (plugins: with plugins; [
        nix
        lua
        javascript
        yaml
        python
        rust
        c
        erlang
        elixir
        go
        gleam
        terraform
      ]))
      nvim-treesitter-context

      lualine-nvim
      lualine-lsp-progress

      # Telescope
      telescope-nvim
      telescope-fzf-native-nvim

      # Indent lines
      indent-blankline-nvim

      # Editing
      align
      comment-nvim
      copilot-lua
      undotree
    ];
    extraConfig = ''
      lua << EOF
      ${lib.strings.fileContents ./lua/settings.lua}
      ${lib.strings.fileContents ./lua/nvim-tree.lua}
      ${lib.strings.fileContents ./lua/telescope.lua}
      ${lib.strings.fileContents ./lua/lualine.lua}
      ${lib.strings.fileContents ./lua/comment.lua}
      ${lib.strings.fileContents ./lua/treesitter.lua}
      ${lib.strings.fileContents ./lua/lsp.lua}
      ${lib.strings.fileContents ./lua/gitsigns.lua}
      ${lib.strings.fileContents ./lua/neogit.lua}
      ${lib.strings.fileContents ./lua/copilot.lua}
      ${lib.strings.fileContents ./lua/harpoon.lua}
      ${lib.strings.fileContents ./lua/undotree.lua}
      EOF
    '';
  };

  home.packages = with pkgs; [ ripgrep ];
}
