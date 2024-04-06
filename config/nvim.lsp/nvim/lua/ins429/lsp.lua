local cmp = require 'cmp'

cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = "buffer" },
  },

  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
  },

  -- documentation = {
  --   maxheight = math.floor(40 * (40 / vim.o.lines)),
  -- },
}

-- require('lspconfig').tsserver.setup{ }

local lspconfig = require('lspconfig')
lspconfig.eslint.setup {
  cmd = { "vscode-eslint-language-server", "--stdio", "--resolve-plugins-relative-to",
      "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/node_modules" },
  settings = {
    workingDirectory = { mode = 'location' },
  },
  root_dir = lspconfig.util.find_git_ancestor(),
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

vim.lsp.set_log_level(0)

-- The following example advertise capabilities to `clangd`.
-- require'lspconfig'.clangd.setup {
--   capabilities = capabilities,
-- }
