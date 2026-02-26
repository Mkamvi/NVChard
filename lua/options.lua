require "nvchad.options"

-- 前端开发核心配置
local o = vim.o

-- 显示设置
o.relativenumber = true -- 相对行号（黑客风格）
o.cursorline = true -- 高亮当前行
o.cursorcolumn = false -- 关闭列高亮
o.signcolumn = "yes" -- 左侧符号列

-- 编辑设置
o.tabstop = 2 -- Tab 宽度2（前端规范）
o.softtabstop = 2 -- 软Tab宽度2
o.shiftwidth = 2 -- 缩进宽度2
o.expandtab = true -- Tab转空格
o.smartindent = true -- 智能缩进
o.autoindent = true -- 自动缩进

-- 搜索设置
o.hlsearch = true -- 高亮搜索结果
o.incsearch = true -- 增量搜索
o.ignorecase = true -- 搜索忽略大小写
o.smartcase = true -- 智能大小写

-- 代码折叠
o.foldenable = true -- 启用代码折叠
o.foldmethod = "expr" -- 基于表达式的折叠
o.foldexpr = "nvim_treesitter#foldexpr()" -- 使用 treesitter 进行折叠
o.foldlevel = 99 -- 默认不折叠

-- 性能设置
o.swapfile = false -- 禁用交换文件
o.backup = false -- 禁用备份
o.writebackup = false -- 禁用写入备份
o.undofile = true -- 启用持久化撤销
o.undodir = os.getenv "HOME" .. "/.config/nvim/undodir" -- 撤销文件目录

-- 界面设置
o.laststatus = 3 -- 全局状态栏
o.cmdheight = 1 -- 命令行高度
o.wrap = false -- 不换行

-- 搜索路径
o.path = ".,**" -- 递归搜索
o.wildignore = "**/node_modules/**,**/dist/**,**/build/**" -- 忽略前端构建目录

-- 识别更多前端文件类型
vim.filetype.add {
  extension = {
    tsx = "typescriptreact",
    jsx = "javascriptreact",
    mjs = "javascript",
    mts = "typescript",
    jsonc = "jsonc",
    vue = "vue",
    svelte = "svelte",
    astro = "astro",
  },
}

-- 创建撤销目录
local undodir = vim.fn.expand(o.undodir)
if not vim.fn.isdirectory(undodir) then
  vim.fn.mkdir(undodir, "p")
end

-- neovide 配置
-- vim.g.neovide_fullscreen = true
vim.g.neovide_scale_factor = 0.8

vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_hide_mouse_when_typing = true

-- 使用PowerShell
local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExearcutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %-NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.cmd "language zh_CN.utf8"
  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end
