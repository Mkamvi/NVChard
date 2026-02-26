-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local M = {}

M.base46 = {
  theme = "gruber-darker",
  theme_toggle = { "gruber-darker", "github_light" },
  changed_themes = {
    gruber_darker = {
      base_16 = {
        base00 = "#000000",
        base01 = "#262626",
        base02 = "#303030",
        base03 = "#585858",
        base04 = "#b8b8b8",
        base05 = "#e8e8e8",
        base06 = "#f8f8f8",
        base07 = "#ffffff",
        base08 = "#ff6c60",
        base09 = "#ff9b54",
        base0A = "#ffffb6",
        base0B = "#a8ff60",
        base0C = "#c6c5fe",
        base0D = "#96cbfe",
        base0E = "#ff73fd",
        base0F = "#b18a3d",
      },
      base_30 = {
        black = "#000000",
        darker_black = "#000000",
        white = "#ffffff",
        black2 = "#121212",
        one_bg = "#1a1a1a",
        one_bg2 = "#252525",
        one_bg3 = "#303030",
        grey = "#454545",
        grey_fg = "#9e9e9e",
        grey_fg2 = "#7c7c7c",
        light_grey = "#525252",
        red = "#ff6c60",
        baby_pink = "#ff79c6",
        pink = "#ff79c6",
        line = "#303030",
        green = "#a8ff60",
        vibrant_green = "#a8ff60",
        blue = "#96cbfe",
        nord_blue = "#83a598",
        yellow = "#ffffb6",
        sun = "#ffffb6",
        purple = "#c6c5fe",
        dark_purple = "#bd93f9",
        teal = "#66d9e8",
        orange = "#ff9b54",
        cyan = "#66d9e8",
        statusline_bg = "#1a1a1a",
        lightbg = "#303030",
        pmenu_bg = "#a8ff60",
        folder_bg = "#96cbfe",
      },
    },
  },
  hl_override = {
    Comment = { fg = "#585858" },
    String = { fg = "#a8ff60" },
    Number = { fg = "#ff9b54" },
    Boolean = { fg = "#ff9b54" },
    Type = { fg = "#96cbfe" },
    Function = { fg = "#ffffb6" },
    Keyword = { fg = "#ff6c60" },
    Operator = { fg = "#ff73fd" },
    Special = { fg = "#c6c5fe" },
  },
}

-- 禁用 nvdash 以避免错误
-- M.nvdash = {
--   load_on_startup = false,
--   header = {
--     "           ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ",
--     "          ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌ ",
--     "          ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌",
--     "          ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌",
--     "          ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌",
--     "          ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌ ",
--     "          ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌",
--     "          ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌",
--     "          ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌",
--     "          ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌",
--     "           ▀         ▀  ▀         ▀  ▀         ▀  ",
--     "",
--     "        FRONTEND HACKER",
--     "",
--   },
--   buttons = {
--     { "  Find File", "Spc f f", "Telescope find_files" },
--     { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
--     { "󰈬  Live Grep", "Spc f g", "Telescope live_grep" },
--     { "  Bookmarks", "Spc m a", "Telescope marks" },
--     { "  Themes", "Spc t h", "Telescope themes" },
--     { "  Mappings", "Spc c h", "NvCheatsheet" },
--   },
-- }

M.ui = {
  statusline = {
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor", "date" },
    modules = {
      date = function()
        return os.date "%Y.%m.%d %X 星期%a"
      end,
    },
  },
  tabufline = {
    enabled = true,
    lazyload = true,
    overriden_modules = function()
      return {
        buttons = function()
          return "%@TbToggle_theme@  %X"
        end,
      }
    end,
  },
}

return M