{ pkgs, ... }: {
  home-manager.users.dmanik = {
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
        fidget-nvim

        plenary-nvim

        harpoon

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

        # Languages
        vim-erlang-runtime
        vim-nix
        rust-tools-nvim

        # Eyecandy
        kanagawa-nvim
        colorbuddy-nvim
        zenbones-nvim
        lush-nvim
        # indent-blankline-nvim

        (nvim-treesitter.withPlugins (plugins:
          with plugins; [
            nix
            lua
            javascript
            yaml
            python
            rust
            c
            erlang
            elixir
            heex
            go
            gleam
            terraform
            zig
          ]))
        nvim-treesitter-context

        lualine-nvim
        lualine-lsp-progress

        # Telescope
        telescope-nvim
        telescope-fzf-native-nvim

        # Editing
        comment-nvim
        copilot-lua
        undotree
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
        ${builtins.readFile ./lua/harpoon.lua}
        ${builtins.readFile ./lua/undotree.lua}
        ${builtins.readFile ./lua/fidget.lua}
        ${builtins.readFile ./lua/utils.lua}
      '';
    };
  };
}
