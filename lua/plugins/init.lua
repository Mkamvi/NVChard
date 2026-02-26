return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- 保存时格式化
    opts = require "configs.conform",
  },

  -- LSP 相关
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = {
      ensure_installed = {
        "lua-language-server",
        "typescript-language-server",
        "css-lsp",
        "html-lsp",
        "eslint-lsp",
        "json-lsp",
        "tailwindcss-language-server",
        "emmet-ls",
        "vue-language-server",
        "svelte-language-server",
        "astro-language-server",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    config = function()
      require("lspsaga").setup()
    end,
  },


  -- 自动补全
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("configs.cmp")
    end,
  },

  -- 语法高亮
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("configs.treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },

  -- 前端专属
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "mattn/emmet-vim",
  },
  {
    "AndrewRadev/tagalong.vim",
  },
  {
    "axelvc/template-string.nvim",
    config = function()
      require("template-string").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "RRethy/vim-illuminate",
  },

  -- 调试
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("configs.dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    config = function()
      require("dap-vscode-js").setup()
    end,
  },

  -- 其他工具
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require "configs.toggleterm"
    end,
  },
  {
    "phaazon/hop.nvim",
    lazy = false,
    config = function()
      require("hop").setup()
    end,
  },
  {
    "windwp/nvim-spectre",
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "moll/vim-bbye",
    lazy = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = true,
      },
      update_focused_file = {
        enable = false,
        update_root = false,
      },
      view = {
        width = 44,
      },
      renderer = {
        root_folder_label = function(path)
          local project_name = vim.fn.fnamemodify(path, ":t")
          return "🥛 " .. project_name
        end,
      },
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"
        api.config.mappings.default_on_attach(bufnr)
        -- 移除 Ctrl-e 映射
        vim.keymap.del("n", "<C-e>", { buffer = bufnr })
      end,
    },
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
