require "nvchad.mappings"

-- add yours here
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new {
  cmd = "lazygit",
  hidden = true,
  count = 5,
  direction = "float",
  float_opts = {
    border = "curved",
    width = 200,
    height = 60,
    winblend = 0,
  },
}
-- h: git
vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<cr>")
vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<cr>")
vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<cr>")
vim.keymap.set("n", "<leader>gc", ":Gitsigns preview_hunk<cr>")
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<cr>")
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<cr>")
vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<cr>")
vim.keymap.set("n", "<leader>gg", function()
  lazygit:toggle()
end, {
  noremap = true,
  silent = true,
})

vim.keymap.set("n", "<leader>tt", function()
  require("base46").toggle_theme()
end)

vim.keymap.set("n", "<leader>q", ":Bdelete<cr>") -- 删除tab(bufferline)
vim.keymap.set("n", "<leader>aq", ":bufdo :Bdelete<cr>") -- 删除tab(bufferline)
vim.keymap.set("n", "<leader>aa", ":quitall<cr>") -- 删除tab(bufferline)

-- window resize
vim.keymap.set("n", "-", ":sp<cr>")
vim.keymap.set("n", "|", ":vs<cr>")
vim.keymap.set("n", "<S-Left>", "<c-w><")
vim.keymap.set("n", "<S-Right>", "<c-w>>")
vim.keymap.set("n", "<S-Down>", "<c-w>-")
vim.keymap.set("n", "<S-Up>", "<c-w>+")

-- Hop
vim.keymap.set("n", "<leader>ll", ":HopLine<CR>")
vim.keymap.set("n", "<leader>ww", ":HopWord<CR>")
vim.keymap.set("n", "<leader>lw", ":HopWordCurrentLine<CR>")

-- 全局替换
vim.keymap.set("n", "<leader>S", require("spectre").open)

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map("n", "<C-t>", function()
--   require("minty.shades").open()
-- end, {})
-- map("n", "<C-p>", function()
--   local api = require("minty.shades.api")
--   api.save_color()
-- end, {})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--

-- vim.keymap.set("n", "<C-t>", function()
--   require("menu").open "default"
-- end, {})
