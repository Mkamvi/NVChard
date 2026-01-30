vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = ";"

vim.g.vscode_snippets_path = vim.fn.fnamemodify(vim.fn.stdpath('config') .. '/.vsnip', ':p')
vim.filetype.add({
  extension = {
    rtsx = "typescriptreact",
  },
})
vim.filetype.add({
  extension = {
    swig = "html",
  },
})

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

if vim.g.neovide then
  vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h14"
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "rescript",
    callback = function()
      vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h14"
    end,
  })
end

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)



