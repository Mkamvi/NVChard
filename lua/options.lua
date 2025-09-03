require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.opt.relativenumber = true

-- neovide 配置
-- vim.g.neovide_fullscreen = true
vim.g.neovide_scale_factor = 0.8

vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_hide_mouse_when_typing = true

vim.g.vscode_snippets_path = "~/.config/nvim/.vsnip"

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
