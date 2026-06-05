-- ─────────────────────────────────────────────
--  LazyVim Configuration — NTH//07
--  Theme: U.E.S.C. Marathon Terminal
--  Place at: ~/.config/nvim/lua/plugins/marathon.lua
-- ─────────────────────────────────────────────

return {

  -- ── Disable LazyVim's default colorscheme ────────────────────────────────
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "marathon",
    },
  },

  -- ── Marathon colorscheme (defined inline via lush or direct :hi) ─────────
  {
    "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Define the colorscheme programmatically so we don't need an external repo
      local lush = require("lush")
      local hsl  = lush.hsl

      -- ── Palette ──────────────────────────────────────────────────────────
      local p = {
        bg        = "#0a0f0a",   -- terminal black (slight green tint)
        bg2       = "#0f150f",   -- slightly lighter surface
        bg3       = "#152015",   -- panel / sidebar background
        bg_sel    = "#1a2e1a",   -- selection / visual highlight
        border    = "#1f3020",   -- window borders, split lines
        comment   = "#2d5030",   -- muted comments — deep dark green
        muted     = "#3a6040",   -- line numbers, folds, non-text
        subtle    = "#507055",   -- inactive status, dimmed UI
        fg_dark   = "#70ff88",   -- slightly dimmed foreground (bright green)
        fg        = "#39ff5a",   -- phosphor green — primary foreground
        fg_bright = "#a8ffa8",   -- white-green — for emphasis / bold
        cursor    = "#39ff5a",
        search    = "#b0ffb8",   -- search highlight bg
        search_fg = "#0a0f0a",

        -- Syntax accent colors (stay within the phosphor green family)
        keyword   = "#1aff8c",   -- keywords — teal-green
        func      = "#00ffaa",   -- functions — cyan-green
        string    = "#b8ff70",   -- strings — yellow-green
        number    = "#ccff88",   -- numbers
        type      = "#44ffaa",   -- types / classes — bright teal
        special   = "#33ffcc",   -- special / built-in
        constant  = "#70ff88",   -- constants
        preproc   = "#00e56e",   -- macros / preprocessor / annotations

        -- Diagnostics (break monochrome only for severity)
        error     = "#ff4444",
        warn      = "#b8ff70",
        info      = "#39ff5a",
        hint      = "#2d5030",

        -- Git
        git_add   = "#39ff5a",
        git_del   = "#ff4444",
        git_chg   = "#b8ff70",
      }

      -- ── Theme definition via lush ─────────────────────────────────────────
      ---@diagnostic disable: undefined-global
      local theme = lush(function(injected_functions)
        local sym = injected_functions.sym

        return {
          -- Core
          Normal         { bg = p.bg,     fg = p.fg },
          NormalNC       { bg = p.bg,     fg = p.subtle },
          NormalFloat    { bg = p.bg2,    fg = p.fg },
          FloatBorder    { bg = p.bg2,    fg = p.border },
          FloatTitle     { bg = p.bg2,    fg = p.fg,     gui = "bold" },

          -- Cursor
          Cursor         { bg = p.cursor, fg = p.bg },
          CursorIM       { bg = p.cursor, fg = p.bg },
          CursorLine     { bg = p.bg2 },
          CursorLineNr   { bg = p.bg2,    fg = p.fg,     gui = "bold" },
          CursorColumn   { bg = p.bg2 },

          -- Line numbers
          LineNr         { fg = p.muted },
          SignColumn     { bg = p.bg },

          -- Selection / Visual
          Visual         { bg = p.bg_sel },
          VisualNOS      { bg = p.bg_sel },

          -- Search
          Search         { bg = p.bg_sel, fg = p.search,    gui = "bold" },
          IncSearch      { bg = p.search, fg = p.search_fg, gui = "bold" },
          CurSearch      { bg = p.search, fg = p.search_fg, gui = "bold" },
          Substitute     { bg = p.bg_sel, fg = p.string,    gui = "bold" },

          -- Status line
          StatusLine     { bg = p.bg3,    fg = p.fg },
          StatusLineNC   { bg = p.bg3,    fg = p.subtle },

          -- Tab line
          TabLine        { bg = p.bg3,    fg = p.subtle },
          TabLineSel     { bg = p.bg,     fg = p.fg,     gui = "bold" },
          TabLineFill    { bg = p.bg3 },

          -- Windows / splits
          WinSeparator   { fg = p.border },
          VertSplit      { fg = p.border },

          -- Popup / menu
          Pmenu          { bg = p.bg2,    fg = p.fg },
          PmenuSel       { bg = p.bg_sel, fg = p.fg,     gui = "bold" },
          PmenuSbar      { bg = p.bg3 },
          PmenuThumb     { bg = p.muted },
          WildMenu       { bg = p.bg_sel, fg = p.fg },

          -- Folds / special lines
          Folded         { bg = p.bg3,    fg = p.comment },
          FoldColumn     { bg = p.bg,     fg = p.comment },
          ColorColumn    { bg = p.bg2 },
          QuickFixLine   { bg = p.bg_sel, fg = p.fg },

          -- Messages
          ErrorMsg       { fg = p.error,  gui = "bold" },
          WarningMsg     { fg = p.warn },
          ModeMsg        { fg = p.fg,     gui = "bold" },
          MoreMsg        { fg = p.func },
          Question       { fg = p.keyword },

          -- Misc UI
          NonText        { fg = p.comment },
          EndOfBuffer    { fg = p.bg3 },
          Conceal        { fg = p.comment },
          SpecialKey     { fg = p.comment },
          Whitespace     { fg = p.border },
          Directory      { fg = p.func,   gui = "bold" },
          Title          { fg = p.fg,     gui = "bold" },
          MatchParen     { bg = p.bg_sel, fg = p.fg,     gui = "bold,underline" },

          -- Diff
          DiffAdd        { bg = "#0d1f0d", fg = p.git_add },
          DiffDelete     { bg = "#1f0d0d", fg = p.git_del },
          DiffChange     { bg = "#1a1f0a" },
          DiffText       { bg = "#2a2f10", fg = p.git_chg, gui = "bold" },
          Added          { fg = p.git_add },
          Removed        { fg = p.git_del },
          Changed        { fg = p.git_chg },

          -- Spelling
          SpellBad       { gui = "undercurl", sp = p.error },
          SpellCap       { gui = "undercurl", sp = p.warn },
          SpellRare      { gui = "undercurl", sp = p.info },
          SpellLocal     { gui = "undercurl", sp = p.info },

          -- ── Syntax ───────────────────────────────────────────────────────
          Comment        { fg = p.comment, gui = "italic" },

          Constant       { fg = p.constant },
          String         { fg = p.string },
          Character      { fg = p.string },
          Number         { fg = p.number },
          Boolean        { fg = p.keyword },
          Float          { fg = p.number },

          Identifier     { fg = p.fg },
          Function       { fg = p.func,    gui = "bold" },

          Statement      { fg = p.keyword },
          Conditional    { fg = p.keyword },
          Repeat         { fg = p.keyword },
          Label          { fg = p.keyword },
          Operator       { fg = p.muted .. "cc", gui = "bold" },  -- slightly dimmed
          Keyword        { fg = p.keyword },
          Exception      { fg = p.error },

          PreProc        { fg = p.preproc },
          Include        { fg = p.preproc },
          Define         { fg = p.preproc },
          Macro          { fg = p.preproc },
          PreCondit      { fg = p.preproc },

          Type           { fg = p.type },
          StorageClass   { fg = p.type },
          Structure      { fg = p.type },
          Typedef        { fg = p.type },

          Special        { fg = p.special },
          SpecialChar    { fg = p.special },
          Tag            { fg = p.special },
          Delimiter      { fg = p.subtle },
          SpecialComment { fg = p.muted, gui = "bold,italic" },
          Debug          { fg = p.warn },

          Underlined     { gui = "underline" },
          Bold           { gui = "bold" },
          Italic         { gui = "italic" },
          Ignore         { fg = p.comment },
          Error          { fg = p.error, gui = "bold" },
          Todo           { fg = p.fg, bg = p.bg_sel, gui = "bold" },

          -- ── Treesitter ───────────────────────────────────────────────────
          sym("@variable")                  { fg = p.fg },
          sym("@variable.builtin")          { fg = p.keyword },
          sym("@variable.parameter")        { fg = p.fg_dark },
          sym("@variable.member")           { fg = p.fg },

          sym("@constant")                  { fg = p.constant },
          sym("@constant.builtin")          { fg = p.keyword },
          sym("@constant.macro")            { fg = p.preproc },

          sym("@module")                    { fg = p.type },
          sym("@label")                     { fg = p.keyword },

          sym("@string")                    { fg = p.string },
          sym("@string.escape")             { fg = p.special },
          sym("@string.special")            { fg = p.special },
          sym("@string.regexp")             { fg = p.special },

          sym("@character")                 { fg = p.string },
          sym("@number")                    { fg = p.number },
          sym("@number.float")              { fg = p.number },
          sym("@boolean")                   { fg = p.keyword },

          sym("@type")                      { fg = p.type },
          sym("@type.builtin")              { fg = p.type,    gui = "italic" },
          sym("@type.definition")           { fg = p.type },

          sym("@attribute")                 { fg = p.preproc },
          sym("@property")                  { fg = p.fg_dark },

          sym("@function")                  { fg = p.func,    gui = "bold" },
          sym("@function.builtin")          { fg = p.func,    gui = "bold" },
          sym("@function.call")             { fg = p.func },
          sym("@function.macro")            { fg = p.preproc },
          sym("@function.method")           { fg = p.func },
          sym("@function.method.call")      { fg = p.func },
          sym("@constructor")               { fg = p.type },

          sym("@keyword")                   { fg = p.keyword },
          sym("@keyword.conditional")       { fg = p.keyword },
          sym("@keyword.coroutine")         { fg = p.keyword },
          sym("@keyword.debug")             { fg = p.warn },
          sym("@keyword.directive")         { fg = p.preproc },
          sym("@keyword.exception")         { fg = p.error },
          sym("@keyword.function")          { fg = p.keyword },
          sym("@keyword.import")            { fg = p.preproc },
          sym("@keyword.modifier")          { fg = p.keyword },
          sym("@keyword.operator")          { fg = p.keyword },
          sym("@keyword.repeat")            { fg = p.keyword },
          sym("@keyword.return")            { fg = p.keyword },
          sym("@keyword.type")              { fg = p.keyword },

          sym("@operator")                  { fg = p.subtle },
          sym("@punctuation.delimiter")     { fg = p.subtle },
          sym("@punctuation.bracket")       { fg = p.subtle },
          sym("@punctuation.special")       { fg = p.special },

          sym("@comment")                   { fg = p.comment, gui = "italic" },
          sym("@comment.documentation")     { fg = p.muted,   gui = "italic" },
          sym("@comment.error")             { fg = p.error,   gui = "bold,italic" },
          sym("@comment.warning")           { fg = p.warn,    gui = "bold,italic" },
          sym("@comment.todo")              { fg = p.fg, bg = p.bg_sel, gui = "bold" },
          sym("@comment.note")              { fg = p.info },

          sym("@markup.heading")            { fg = p.fg,      gui = "bold" },
          sym("@markup.heading.1")          { fg = p.func,    gui = "bold" },
          sym("@markup.heading.2")          { fg = p.type,    gui = "bold" },
          sym("@markup.italic")             { gui = "italic" },
          sym("@markup.strong")             { gui = "bold" },
          sym("@markup.strikethrough")      { gui = "strikethrough" },
          sym("@markup.underline")          { gui = "underline" },
          sym("@markup.link")               { fg = p.func },
          sym("@markup.link.url")           { fg = p.string,  gui = "underline" },
          sym("@markup.raw")                { fg = p.special },
          sym("@markup.list")               { fg = p.keyword },
          sym("@markup.list.checked")       { fg = p.git_add },
          sym("@markup.list.unchecked")     { fg = p.comment },

          sym("@tag")                       { fg = p.keyword },
          sym("@tag.attribute")             { fg = p.type },
          sym("@tag.delimiter")             { fg = p.subtle },

          -- ── LSP ──────────────────────────────────────────────────────────
          DiagnosticError                   { fg = p.error },
          DiagnosticWarn                    { fg = p.warn },
          DiagnosticInfo                    { fg = p.info },
          DiagnosticHint                    { fg = p.muted },
          DiagnosticOk                      { fg = p.git_add },

          DiagnosticUnderlineError          { gui = "undercurl", sp = p.error },
          DiagnosticUnderlineWarn           { gui = "undercurl", sp = p.warn },
          DiagnosticUnderlineInfo           { gui = "undercurl", sp = p.info },
          DiagnosticUnderlineHint           { gui = "undercurl", sp = p.muted },

          DiagnosticVirtualTextError        { fg = p.error,  bg = "#1f0d0d" },
          DiagnosticVirtualTextWarn         { fg = p.warn,   bg = "#1a1f0a" },
          DiagnosticVirtualTextInfo         { fg = p.info,   bg = "#0d1a0d" },
          DiagnosticVirtualTextHint         { fg = p.muted,  bg = p.bg3 },

          DiagnosticFloatingError           { fg = p.error },
          DiagnosticFloatingWarn            { fg = p.warn },
          DiagnosticFloatingInfo            { fg = p.info },
          DiagnosticFloatingHint            { fg = p.muted },

          LspReferenceText                  { bg = p.bg_sel },
          LspReferenceRead                  { bg = p.bg_sel },
          LspReferenceWrite                 { bg = p.bg_sel, gui = "bold" },
          LspSignatureActiveParameter       { fg = p.string, gui = "bold,underline" },
          LspInlayHint                      { fg = p.comment, bg = p.bg3 },
          LspCodeLens                       { fg = p.muted },

          -- ── Plugin highlights ─────────────────────────────────────────────

          -- Telescope
          TelescopeNormal         { bg = p.bg2,     fg = p.fg },
          TelescopeBorder         { bg = p.bg2,     fg = p.border },
          TelescopePromptBorder   { bg = p.bg3,     fg = p.fg },
          TelescopePromptNormal   { bg = p.bg3,     fg = p.fg },
          TelescopePromptPrefix   { bg = p.bg3,     fg = p.func,    gui = "bold" },
          TelescopeResultsBorder  { bg = p.bg2,     fg = p.border },
          TelescopePreviewBorder  { bg = p.bg2,     fg = p.border },
          TelescopeMatching       { fg = p.string,  gui = "bold" },
          TelescopeSelection      { bg = p.bg_sel,  fg = p.fg },
          TelescopeSelectionCaret { fg = p.func,    gui = "bold" },
          TelescopeTitle          { fg = p.fg,      gui = "bold" },

          -- nvim-tree / neo-tree
          NvimTreeNormal          { bg = p.bg3,     fg = p.fg },
          NvimTreeNormalNC        { bg = p.bg3,     fg = p.subtle },
          NvimTreeWinSeparator    { bg = p.bg3,     fg = p.border },
          NvimTreeFolderName      { fg = p.func },
          NvimTreeOpenedFolderName{ fg = p.func,    gui = "bold" },
          NvimTreeRootFolder      { fg = p.keyword, gui = "bold" },
          NvimTreeGitDirty        { fg = p.git_chg },
          NvimTreeGitNew          { fg = p.git_add },
          NvimTreeGitDeleted      { fg = p.git_del },
          NvimTreeIndentMarker    { fg = p.border },
          NvimTreeSymlink         { fg = p.special },
          NvimTreeExecFile        { fg = p.func,    gui = "bold" },

          -- GitSigns
          GitSignsAdd             { fg = p.git_add },
          GitSignsChange          { fg = p.git_chg },
          GitSignsDelete          { fg = p.git_del },
          GitSignsAddLn           { bg = "#0d1f0d" },
          GitSignsChangeLn        { bg = "#1a1f0a" },
          GitSignsDeleteLn        { bg = "#1f0d0d" },

          -- Which-key
          WhichKey                { fg = p.keyword, gui = "bold" },
          WhichKeyGroup           { fg = p.type },
          WhichKeyDesc            { fg = p.fg },
          WhichKeySeparator       { fg = p.comment },
          WhichKeyFloat           { bg = p.bg2 },

          -- Indent Blankline
          IblIndent               { fg = p.border },
          IblScope                { fg = p.muted },

          -- nvim-cmp
          CmpItemAbbr             { fg = p.fg },
          CmpItemAbbrDeprecated   { fg = p.subtle,  gui = "strikethrough" },
          CmpItemAbbrMatch        { fg = p.string,  gui = "bold" },
          CmpItemAbbrMatchFuzzy   { fg = p.string,  gui = "bold" },
          CmpItemKind             { fg = p.type },
          CmpItemMenu             { fg = p.comment },
          CmpDocumentation        { bg = p.bg2 },
          CmpDocumentationBorder  { bg = p.bg2,     fg = p.border },

          -- Lualine (expose palette for lualine config below)
          LualineA_Normal         { bg = p.fg,      fg = p.bg,      gui = "bold" },
          LualineB_Normal         { bg = p.bg3,     fg = p.fg },
          LualineC_Normal         { bg = p.bg2,     fg = p.subtle },

          -- Mini.nvim (mini.files, mini.statusline, etc.)
          MiniFilesTitleFocused   { fg = p.fg,      gui = "bold" },
          MiniFilesTitle          { fg = p.subtle },
          MiniStatuslineDevinfo   { bg = p.bg3,     fg = p.subtle },
          MiniStatuslineFilename  { bg = p.bg2,     fg = p.fg },
          MiniStatuslineModeNormal{ bg = p.fg,      fg = p.bg,      gui = "bold" },
          MiniStatuslineModeInsert{ bg = p.func,    fg = p.bg,      gui = "bold" },
          MiniStatuslineModeVisual{ bg = p.string,  fg = p.bg,      gui = "bold" },
          MiniStatuslineModeReplace{ bg = p.error,  fg = p.bg,      gui = "bold" },
          MiniStatuslineModeCommand{ bg = p.keyword,fg = p.bg,      gui = "bold" },

          -- Flash.nvim
          FlashLabel              { bg = p.string,  fg = p.bg,      gui = "bold" },
          FlashMatch              { bg = p.bg_sel,  fg = p.fg },
          FlashCurrent            { bg = p.search,  fg = p.search_fg,gui = "bold" },

          -- Noice / notify
          NoiceFormatProgressDone   { bg = p.func,  fg = p.bg },
          NoiceFormatProgressTodo   { bg = p.bg3,   fg = p.comment },
          NoiceLspProgressSpinner   { fg = p.func },

          -- Snacks.nvim (LazyVim default picker / dashboard)
          SnacksDashboardHeader   { fg = p.func,    gui = "bold" },
          SnacksDashboardDesc     { fg = p.fg },
          SnacksDashboardKey      { fg = p.keyword, gui = "bold" },
          SnacksDashboardIcon     { fg = p.type },
          SnacksDashboardFooter   { fg = p.comment, gui = "italic" },
          SnacksPickerBorder      { fg = p.border },
          SnacksPickerMatch       { fg = p.string,  gui = "bold" },
          SnacksPickerSelected    { bg = p.bg_sel },
        }
      end)
      ---@diagnostic enable: undefined-global

      lush.apply(lush.compile(theme))

      -- Register as a named colorscheme so LazyVim can load it by name
      vim.g.colors_name = "marathon"
    end,
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
        section_separators   = { left = "",  right = "" },
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
