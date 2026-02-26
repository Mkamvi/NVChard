require("nvchad.configs.lspconfig").defaults()

-- 配置语言服务器选项
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 通用 on_attach 函数
local on_attach = function(client, bufnr)
  -- 禁用格式化（交给 null-ls）
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  -- 快捷键
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', bufopts)
  vim.keymap.set('n', 'gi', '<cmd>Lspsaga goto_type_definition<CR>', bufopts)
  vim.keymap.set('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', bufopts)
  vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', bufopts)
  vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', bufopts)
  vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', bufopts)
  vim.keymap.set('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>', bufopts)
  vim.keymap.set('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>', bufopts)
  vim.keymap.set('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>', bufopts)
  vim.keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', bufopts)
  vim.keymap.set('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', bufopts)
end

-- 前端 LSP 服务器列表
local servers = {
  "html",
  "cssls",
  "ts_ls", -- 替换 tsserver
  "volar",
  "svelte",
  "astro",
  -- "eslint", -- 禁用 eslint LSP，避免 Node/ESLint 报错打扰
  "jsonls",
  "tailwindcss",
  "emmet_ls",
}

-- 配置每个服务器
vim.lsp.config("html", {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'html', 'htmldjango', 'vue', 'svelte', 'astro' },
})

vim.lsp.config("cssls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("volar", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("svelte", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("astro", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- vim.lsp.config("eslint", {
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })

vim.lsp.config("jsonls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("tailwindcss", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("emmet_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'html', 'css', 'scss', 'vue', 'jsx', 'tsx', 'svelte', 'astro' },
})

-- 启用所有服务器
for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

-- 配置 TypeScript 服务器
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
})

-- read :h vim.lsp.config for changing options of lsp servers 
