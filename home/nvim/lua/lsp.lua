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
local servers = { 'rnix', 'rust_analyzer', 'hls', 'kotlin_language_server', 'gopls', 'lua_ls', 'tsserver', 'terraformls', 'clangd', 'zls' }

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

local metals_config = require("metals").bare_config()
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = {},
}
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
metals_config.init_options.statusBarProvider = "on"
metals_config.init_options.showImplicitArguments = true
metals_config.init_options.excludedPackages = {}
metals_config.on_attach = on_attach

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
