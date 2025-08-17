local options = {
  formatters_by_ft = {
    -- 通用文件类型
    lua = { "stylua" },
    python = { "black", "isort" }, -- black 用于代码格式化，isort 用于导入排序
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    go = { "gofmt", "goimports" },
    rust = { "rustfmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },

    -- 可以为同一文件类型配置多个格式化器，按顺序执行
    vue = { "prettier", "eslint_d" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
