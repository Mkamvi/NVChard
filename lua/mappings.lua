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

-- 前端专属快捷键

-- 前端开发相关
map("n", "<leader>z", ":ZenMode<CR>", { desc = "进入专注模式" })
map("n", "<leader>td", ":TodoTelescope<CR>", { desc = "搜索 TODO 注释" })
map("n", "<leader>c", ":CommentToggle<CR>", { desc = "注释/取消注释" })
map("v", "<leader>c", ":CommentToggle<CR>", { desc = "注释/取消注释" })
map("n", "<leader>cp", ":ColorizerToggle<CR>", { desc = "切换颜色预览" })

-- 调试相关
map("n", "<leader>db", function() require('dap').toggle_breakpoint() end, { desc = "切换断点" })
map("n", "<leader>dc", function() require('dap').continue() end, { desc = "继续调试" })
map("n", "<leader>di", function() require('dap').step_into() end, { desc = "步进" })
map("n", "<leader>do", function() require('dap').step_over() end, { desc = "步过" })
map("n", "<leader>dO", function() require('dap').step_out() end, { desc = "步出" })
map("n", "<leader>dr", function() require('dap').repl.open() end, { desc = "打开 REPL" })
map("n", "<leader>du", function() require('dapui').toggle() end, { desc = "切换 DAP UI" })

-- LSP 相关
map("n", "gd", ":Lspsaga goto_definition<CR>", { desc = "跳转到定义" })
map("n", "gi", ":Lspsaga goto_type_definition<CR>", { desc = "跳转到类型定义" })
map("n", "gr", ":Lspsaga lsp_finder<CR>", { desc = "查找引用" })
map("n", "K", ":Lspsaga hover_doc<CR>", { desc = "显示文档" })
map("n", "<leader>rn", ":Lspsaga rename<CR>", { desc = "重命名" })
map("n", "<leader>ca", ":Lspsaga code_action<CR>", { desc = "代码操作" })
map("n", "<leader>sl", ":Lspsaga show_line_diagnostics<CR>", { desc = "显示行诊断" })
map("n", "<leader>sc", ":Lspsaga show_cursor_diagnostics<CR>", { desc = "显示光标诊断" })
map("n", "<leader>sb", ":Lspsaga show_buf_diagnostics<CR>", { desc = "显示缓冲区诊断" })
map("n", "[e", ":Lspsaga diagnostic_jump_prev<CR>", { desc = "上一个诊断" })
map("n", "]e", ":Lspsaga diagnostic_jump_next<CR>", { desc = "下一个诊断" })

-- 缓冲区操作
map("n", "<leader>bn", ":bnext<CR>", { desc = "下一个缓冲区" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "上一个缓冲区" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "删除缓冲区" })

-- 终端操作
map("n", "<leader>t", ":ToggleTerm direction=float<CR>", { desc = "打开终端" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "退出终端插入模式" })

-- 模板字符串增强
map("i", "``", "``<left>", { desc = "快速输入模板字符串" })
map("i", "'", "''<left>", { desc = "快速输入单引号" })
map("i", '"', '""<left>', { desc = "快速输入双引号" })

-- 前端框架快捷操作
map("n", "<leader>v", ":vsplit<CR>", { desc = "快速垂直分屏（Vue 开发常用）" })
map("n", "<leader>s", ":sp<CR>", { desc = "快速水平分屏（Svelte 开发常用）" })
