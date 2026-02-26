require "nvchad.autocmds"

-- 黑客风格 UI 优化

-- 高亮匹配的括号
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.showmatch = true
    vim.opt.matchtime = 2
  end,
})

-- 自动保存
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.cmd "silent! write"
  end,
})

-- 进入终端模式时的设置
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorline = false
  end,
})

-- 黑客风格的光标样式
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.guicursor =
      "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
  end,
})

-- 禁用鼠标
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.mouse = ""
  end,
})

-- 缓冲区删除时的处理
-- vim.api.nvim_create_autocmd("BufDelete", {
--   callback = function()
--     local bufs = vim.t.bufs
--
--     if #bufs == 0 then
--       vim.cmd "Nvdash"
--     end
--   end,
-- })

-- 启动时打开文件树
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})
