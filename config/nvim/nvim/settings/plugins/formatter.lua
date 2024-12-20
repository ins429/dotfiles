-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettier,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier,
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

local autoformat_types = {
  lua = true,
  javascript = true,
  javascriptreact = true,
  json = true,
  typescript = true,
  typescriptreact = true,
}

vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Autoformat certain types of files on save",
  group = vim.api.nvim_create_augroup("autosave", { clear = true }),
  callback = function(opts)
    local effective_autoformat_types = {}

    -- start with the global settings from above
    for type, enabled in pairs(autoformat_types) do
      effective_autoformat_types[type] = enabled
    end

    -- merge in overrides from local config files at runtime
    -- e.g. to disable python and javascript for a given repo
    -- add an .nvim.lua file in the root of the repo with this content
    --
    -- vim.g.autoformat_types = {
    --   python = false,
    --   javascript = false,
    -- }
    if vim.g.autoformat_types then
      for type, enabled in pairs(vim.g.autoformat_types) do
        effective_autoformat_types[type] = enabled
      end
    end

    if effective_autoformat_types[vim.bo[opts.buf].filetype] then
      vim.cmd("FormatWrite")
    end
  end,
})
