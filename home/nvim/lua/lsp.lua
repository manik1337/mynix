vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require 'cmp'

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
    -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    -- ['<Tab>'] = cmp.mapping.select_next_item(),
    -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
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

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>wl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>cf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
local configs = require('lspconfig.configs')

local servers = {
  'rnix', 'rust_analyzer', 'hls',
  'kotlin_language_server', 'gopls', 'lua_ls',
  'tsserver', 'terraformls', 'clangd'
}

for _, server in pairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150, },
    capabilities = capabilities
  }
end

-- local configs = require("lspconfig.configs")
--
-- local lexical_config = {
--   filetypes = { "elixir", "eelixir", },
--   cmd = { "/my/home/projects/_build/dev/package/lexical/bin/start_lexical.sh" },
--   settings = {},
-- }
--
-- if not configs.lexical then
--   configs.lexical = {
--     default_config = {
--       filetypes = lexical_config.filetypes,
--       -- cmd = lexical_config.cmd,
--       cmd = { "/home/dmanik/ws/elixir/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
--       root_dir = function(fname)
--         return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
--       end,
--       -- optional settings
--       settings = lexical_config.settings,
--     },
--   }
-- end

-- lspconfig.lexical.setup({
--   on_attach = on_attach,
--   -- cmd = { "elixir-ls" },
--   flags = { debounce_text_changes = 150 },
--   capabilities = capabilities,
--   settings = {
--     -- elixirLS = {
--     --   dialyzerEnabled = false,
--     --   fetchDeps = true
--     -- }
--   }
-- })

lspconfig.elixirls.setup {
  on_attach = on_attach,
  cmd = { "elixir-ls" },
  flags = { debounce_text_changes = 150 },
  capabilities = capabilities,
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = true
    }
  }
}

lspconfig.pylsp.setup({
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        -- formatter options
        black = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- linter options
        pylint = { enabled = true, executable = "pylint" },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        -- type checker
        pylsp_mypy = { enabled = true },
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- import sorting
        pyls_isort = { enabled = true },
      },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
  capabilities = capabilities,
})

lspconfig.ocamllsp.setup({
  cmd = { "ocamllsp" },
  filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
  root_dir = lspconfig.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
  on_attach = on_attach,
  capabilities = capabilities
})

lspconfig.nil_ls.setup {
  on_attach = on_attach
}

configs.solidity = {
  default_config = {
    cmd = {'npx', 'nomicfoundation-solidity-language-server', '--stdio'},
    filetypes = { 'solidity' },
    root_dir = lspconfig.util.find_git_ancestor,
    single_file_support = true,
  },
}

lspconfig.solidity.setup {}
