local cmp = require 'cmp'

cmp.setup({
  -- snippet = {
  --   -- REQUIRED - you must specify a snippet engine
  --   expand = function(args)
  --     vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  --     -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  --     -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
  --     -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  --   end,
  -- },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- configure each lsp server
require('lspconfig').lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    },
  },
}
require('lspconfig').rust_analyzer.setup {
  capabilities = capabilities
}
require('lspconfig').elixirls.setup {
  capabilities = capabilities
}
require('lspconfig').eslint.setup {
  capabilities = capabilities,

  on_init = function(client)
    print('pjlee on_init')
    local path = client.workspace_folders[1].name

    if string.match(path, '/Users/peterlee/Code/power.platform.ux') then
      client.config.settings = {
        eslint = {},
      }
      client.config.settings.eslint.nodePath =
      "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/node_modules"

      client.config.settings.eslint.options = {
        resolvePluginsRelativeTo = "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/node_modules",
        rulePaths = {
          "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/lib/eslint-rules"
        },
        overrideConfigFile = "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/.eslintrc.base.js",
      }
      print('pjlee', client.config.settings.eslint)
    end

    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    return true
  end,

  -- on_attach = function(client, bufnr)
  --   print('pjlee sup')
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     buffer = bufnr,
  --     command = "EslintFixAll",
  --   })
  -- end,

  -- settings = {
  --   nodePath = "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/node_modules",
  --   options = {
  --     resolvePluginsRelativeTo = "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/node_modules",
  --     rulePaths = { "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/lib/eslint-rules" },
  --     overrideConfigFile = "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/.eslintrc.base.js"
  --   },
  -- },

  -- "eslint.nodePath": "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/node_modules",
  -- "eslint.options": {
  --   "resolvePluginsRelativeTo": "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/node-modules",
  --   "rulePaths": ["/Users/peterlee/Code/power-platform-ux/packages/build-scripts/lib/eslint-rules"],
  --   "overrideConfigFile": "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/.eslintrc.base.js"
  -- }
}
require('lspconfig').tsserver.setup {
  capabilities = capabilities
}
require('lspconfig').pyright.setup {
  capabilities = capabilities
}
