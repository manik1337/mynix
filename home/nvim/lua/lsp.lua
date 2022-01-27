vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "path" },
    { name = "buffer" },
  }),
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp = require'lspconfig'

-- Erlang
require'lspconfig'.erlangls.setup{
  capabilities = capabilities
}

-- Nix
require'lspconfig'.rnix.setup{}

-- Rust
require'lspconfig'.rust_analyzer.setup{
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true
    }
  }
}
