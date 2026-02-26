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
    scss = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    go = { "gofmt", "goimports" },
    rust = { "rustfmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },

    -- 前端框架文件类型
    vue = { "prettier", "eslint_d" },
    svelte = { "prettier" },
    astro = { "prettier" },
  },

  -- 保存时格式化
  format_on_save = {
    -- 传递给 conform.format() 的选项
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
