-- ─────────────────────────────────────────────
--  LazyVim Configuration — NTH//07
--  Theme: U.E.S.C. Marathon Terminal
--  Place at: ~/.config/nvim/lua/plugins/marathon.lua
-- ─────────────────────────────────────────────
return {
  {
    "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "marathon",
    },
  },
  -- ── lualine — Marathon status bar ────────────────────────────────────────
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = {
          normal = {
            a = { bg = "#39ff5a", fg = "#0a0f0a", gui = "bold" },
            b = { bg = "#152015", fg = "#39ff5a" },
            c = { bg = "#0f150f", fg = "#507055" },
          },
          insert = {
            a = { bg = "#00ffaa", fg = "#0a0f0a", gui = "bold" },
            b = { bg = "#152015", fg = "#00ffaa" },
            c = { bg = "#0f150f", fg = "#507055" },
          },
          visual = {
            a = { bg = "#b8ff70", fg = "#0a0f0a", gui = "bold" },
            b = { bg = "#152015", fg = "#b8ff70" },
            c = { bg = "#0f150f", fg = "#507055" },
          },
          replace = {
            a = { bg = "#ff4444", fg = "#0a0f0a", gui = "bold" },
            b = { bg = "#152015", fg = "#ff4444" },
            c = { bg = "#0f150f", fg = "#507055" },
          },
          command = {
            a = { bg = "#1aff8c", fg = "#0a0f0a", gui = "bold" },
            b = { bg = "#152015", fg = "#1aff8c" },
            c = { bg = "#0f150f", fg = "#507055" },
          },
          inactive = {
            a = { bg = "#0f150f", fg = "#3a6040", gui = "bold" },
            b = { bg = "#0f150f", fg = "#3a6040" },
            c = { bg = "#0f150f", fg = "#2d5030" },
          },
        },
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
