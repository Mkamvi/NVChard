return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
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
    "akinsho/org-bullets.nvim",
    lazy = false,
    config = function()
      require("org-bullets").setup()
    end,
  },
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      local org = require "orgmode"
      -- org.setup_ts_grammar()
      -- Setup orgmode
      org.setup {
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
        org_todo_keywords = {
          "TODO",
          "IN-PROGRESS",
          "|",
          "DONE",
          "CANCELLED",
        },
        mappings = {
          org = {
            org_toggle_checkbox = "<Leader>o<Space>",
          },
        },
        win_split_mode = "vertical",
        org_capture_window = {
          height = 44,
        },
        org_capture_templates = {
          d = {
            description = "日记",
            target = "~/orgfiles/daily/%<%Y>/%<%m>.org",
          },
          w = {
            description = "周记",
            target = "~/orgfiles/weekly/%<%Y>/%<%m>/week-%<%Y-%m-%d>.org",
          },
          m = {
            description = "月记",
            target = "~/orgfiles/monthly/%<%Y>/%<%m>.org",
          },
        },
      }
    end,
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
}
