-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local M = {}

M.base46 = {
  -- 使用内置主题 neofusion 作为基础，再用 changed_themes 做赛博微调
  theme = "neofusion",
  theme_toggle = { "neofusion", "github_light" },
  changed_themes = {
    neofusion = {
      base_16 = {
        -- 赛博朋克风格：深色背景 + 高饱和霓虹色
        base00 = "#050510", -- background
        base01 = "#101020",
        base02 = "#181830",
        base03 = "#24243a",
        base04 = "#b0b4d0",
        base05 = "#e0e4ff", -- foreground
        base06 = "#f5f5ff",
        base07 = "#ffffff",
        base08 = "#ff5c7c", -- red / error
        base09 = "#ffb86c", -- orange
        base0A = "#f1fa8c", -- yellow / accent
        base0B = "#50fa7b", -- neon green
        base0C = "#8be9fd", -- cyan
        base0D = "#80ffea", -- teal / cursor line accents
        base0E = "#bd93f9", -- purple
        base0F = "#ff79c6", -- pink
      },
      base_30 = {
        black = "#050510",
        darker_black = "#02020a",
        black2 = "#101020",
        one_bg = "#141428",
        one_bg2 = "#1b1b33",
        one_bg3 = "#24243a",
        grey = "#4c4f6b",
        grey_fg = "#6d7294",
        grey_fg2 = "#8c92b3",
        light_grey = "#a0a6c7",
        -- 霓虹主色
        red = "#ff5c7c",
        baby_pink = "#ff79c6",
        pink = "#ff6ac1",
        line = "#24243a",
        green = "#50fa7b",
        vibrant_green = "#5bfba1",
        blue = "#5a9bff",
        nord_blue = "#4d7dff",
        yellow = "#f1fa8c",
        sun = "#ffe66d",
        purple = "#bd93f9",
        dark_purple = "#7a5cff",
        teal = "#80ffea",
        orange = "#ffb86c",
        cyan = "#8be9fd",
        statusline_bg = "#101020",
        lightbg = "#1b1b33",
        pmenu_bg = "#80ffea",
        folder_bg = "#5a9bff",
      },
    },
  },
  hl_override = {
    Comment = { fg = "#4c4f6b" },
    String = { fg = "#50fa7b" },
    Number = { fg = "#ffb86c" },
    Boolean = { fg = "#ffb86c" },
    Type = { fg = "#80ffea" },
    Function = { fg = "#f1fa8c" },
    Keyword = { fg = "#ff5c7c" },
    Operator = { fg = "#bd93f9" },
    Special = { fg = "#8be9fd" },
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
