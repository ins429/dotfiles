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
  -- cmd = { "vscode-eslint-language-server", "--resolve-plugins-relative-to",
  --   "/Users/peterlee/Code/power-platform-ux/packages/build-scripts", "--stdio" },

  settings = {
    -- nodePath = "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/node_modules",
    -- options = {
    --   resolvePluginsRelativeTo = "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/node_modules",
    --   rulePaths = { "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/lib/eslint-rules" },
    --   overrideConfigFile = "/Users/peterlee/Code/power-platform-ux/packages/build-scripts/.eslintrc.base.js"
    -- },
    workingDirectory = { mode = 'location' },
  },

  root_dir = lspconfig.util.find_git_ancestor,
  on_new_config = function(config, root_dir)
    config.settings.workspaceFolder = {
      uri = root_dir,
      name = vim.fn.fnamemodify(root_dir, ':t'),
    }
    print('pjlee33', config.settings, config.settings.workingDirectory.mode)
    local path = '/Users/peterlee/Code/power-platform-ux'
    if vim.startswith(root_dir, path) then
      print('pjlee44')
      config.settings.nodePath =
      "../../packages/build-scripts/node_modules"

      config.settings.options = {
        resolvePluginsRelativeTo = "../../packages/build-scripts/node_modules",
        rulePaths = {
          "../../packages/build-scripts/lib/eslint-rules"
        },
        overrideConfigFile = "../../packages/build-scripts/.eslintrc.base.js",
      }
    end
    print('pjlee333', config.settings, config.settings.nodePath)
  end

}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

vim.lsp.set_log_level(0)

-- The following example advertise capabilities to `clangd`.
-- require'lspconfig'.clangd.setup {
--   capabilities = capabilities,
-- }

-- hide diagnostics while in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.diagnostic.config({
      virtual_text = false,
    })
  end
})
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.diagnostic.config({
      virtual_text = true,
    })
  end
})
