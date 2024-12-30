{ pkgs, ... }:
{
  home-manager.users.dmanik = {
    home.sessionVariables.EDITOR = "vim";
    programs.neovim = {
      enable = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        vscode-nvim

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
        fidget-nvim

        # DB
        vim-dadbod
        vim-dadbod-ui
        vim-dadbod-completion

        # Git
        diffview-nvim
        gitsigns-nvim

        # File tree
        nvim-web-devicons
        nvim-tree-lua
        oil-nvim

        # Languages
        vim-erlang-runtime
        vim-nix
        rust-tools-nvim

        nvim-treesitter.withAllGrammars
        # nvim-treesitter-context

        lualine-nvim
        lualine-lsp-progress

        # Telescope
        telescope-nvim
        telescope-fzf-native-nvim

        # Editing
        comment-nvim
        copilot-lua
        avante-nvim
        undotree

        # deps
        plenary-nvim
        dressing-nvim
        nui-nvim
      ];
      extraLuaConfig = ''
        ${builtins.readFile ./lua/settings.lua}
        ${builtins.readFile ./lua/nvim-tree.lua}
        ${builtins.readFile ./lua/telescope.lua}
        ${builtins.readFile ./lua/lualine.lua}
        ${builtins.readFile ./lua/comment.lua}
        ${builtins.readFile ./lua/treesitter.lua}
        ${builtins.readFile ./lua/lsp.lua}
        ${builtins.readFile ./lua/gitsigns.lua}
        ${builtins.readFile ./lua/copilot.lua}
        ${builtins.readFile ./lua/undotree.lua}
        ${builtins.readFile ./lua/fidget.lua}
        ${builtins.readFile ./lua/utils.lua}
        ${builtins.readFile ./lua/avante.lua}
        ${builtins.readFile ./lua/oil.lua}
      '';
    };
  };
}
