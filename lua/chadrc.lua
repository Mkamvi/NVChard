-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local M = {}

M.base46 = {
  theme = "github_light",
  theme_toggle = { "github_dark", "github_light" },
  changed_themes = {
    onenord_light = {
      base_30 = {
        light_grey = "#828684",
        grey_fg = "#828684",
      },
    },
    onenord = {
      base_16 = {
        base0B = "#64ff52",
      },
    },
  },
  hl_override = {
  },
}

M.nvdash = {
  -- load_on_startup = true,
  header = {
    ".·´(                    ",
    "   /(.·´(      )::..:`·.( `·.           ",
    "   )::..::`·._/;;  --  ' '\\.::)  )\\    ’'",
    ".·´;; --  ' '               \\/.·´ .:(.·´(",
    "):/\\                 ,..::´/):::..::::·´",
    "I/::::\\...:´/\\       \\::::'/ /¯¯¯¯’/  ",
    " \\::::/:::'/:::\\       \\-´ '/       /    ",
    "   \\/;::-' \\::::'\\       \\/       /      ",
    "            \\:::::\\            /        ",
    "              \\:::/            \\        ",
    "             )\\'/\\       /\\      '\\      ",
    "    )\\    .·´.:/       /:::\\       \\    ",
    ".·´.::.`·.):.'/.. - ··  ´´       .·´/'   ",
    "`·::..;::-  '        ..-:::::'/::::/'    ",
    "   )/::`*..¸..-::::::::::::/:::·´’      ",
    "  /::::::::/::::::::::-·· ´´            ",
    "  `*-::;/::::-·· ´´'’                   ",
    "", -- 空行分隔
    "", -- 空行分隔
  },
}
M.ui = {
  statusline = {
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor", "date" },
    modules = {
      date = function()
        return os.date "%Y.%m.%d %X 星期%a"
      end,
    },
  },
}

return M
