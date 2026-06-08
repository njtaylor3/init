-- ─────────────────────────────────────────────
--  Marathon Colorscheme — NTH//07
--  U.E.S.C. Marathon phosphor green
--  Place at: ~/.config/nvim/colors/marathon.lua
--  No external dependencies.
-- ─────────────────────────────────────────────

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "marathon"
vim.o.termguicolors = true

local hi = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

-- ── Palette ──────────────────────────────────────────────────────────────────
local p = {
  bg = "#0a0f0a",
  bg2 = "#0f150f",
  bg3 = "#152015",
  bg_sel = "#1a2e1a",
  border = "#1f3020",
  comment = "#2d5030",
  muted = "#3a6040",
  subtle = "#507055",
  fg_dark = "#70ff88",
  fg = "#39ff5a",
  fg_bright = "#a8ffa8",
  search = "#b0ffb8",
  search_fg = "#0a0f0a",
  keyword = "#1aff8c",
  func = "#00ffaa",
  string = "#b8ff70",
  number = "#ccff88",
  type = "#44ffaa",
  special = "#33ffcc",
  constant = "#70ff88",
  preproc = "#00e56e",
  error = "#ff4444",
  warn = "#b8ff70",
  info = "#39ff5a",
  hint = "#2d5030",
  git_add = "#39ff5a",
  git_del = "#ff4444",
  git_chg = "#b8ff70",
}

-- ── Core ─────────────────────────────────────────────────────────────────────
hi("Normal", { bg = p.bg, fg = p.fg })
hi("NormalNC", { bg = p.bg, fg = p.subtle })
hi("NormalFloat", { bg = p.bg2, fg = p.fg })
hi("FloatBorder", { bg = p.bg2, fg = p.border })
hi("FloatTitle", { bg = p.bg2, fg = p.fg, bold = true })

-- ── Cursor ────────────────────────────────────────────────────────────────────
hi("Cursor", { bg = p.fg, fg = p.bg })
hi("CursorIM", { bg = p.fg, fg = p.bg })
hi("CursorLine", { bg = p.bg2 })
hi("CursorLineNr", { bg = p.bg2, fg = p.fg, bold = true })
hi("CursorColumn", { bg = p.bg2 })

-- ── Line numbers ──────────────────────────────────────────────────────────────
hi("LineNr", { fg = p.muted })
hi("SignColumn", { bg = p.bg })

-- ── Selection ─────────────────────────────────────────────────────────────────
hi("Visual", { bg = p.bg_sel })
hi("VisualNOS", { bg = p.bg_sel })

-- ── Search ────────────────────────────────────────────────────────────────────
hi("Search", { bg = p.bg_sel, fg = p.search, bold = true })
hi("IncSearch", { bg = p.search, fg = p.search_fg, bold = true })
hi("CurSearch", { bg = p.search, fg = p.search_fg, bold = true })
hi("Substitute", { bg = p.bg_sel, fg = p.string, bold = true })

-- ── Status / tab line ─────────────────────────────────────────────────────────
hi("StatusLine", { bg = p.bg3, fg = p.fg })
hi("StatusLineNC", { bg = p.bg3, fg = p.subtle })
hi("TabLine", { bg = p.bg3, fg = p.subtle })
hi("TabLineSel", { bg = p.bg, fg = p.fg, bold = true })
hi("TabLineFill", { bg = p.bg3 })

-- ── Windows ───────────────────────────────────────────────────────────────────
hi("WinSeparator", { fg = p.border })
hi("VertSplit", { fg = p.border })

-- ── Popup / menu ──────────────────────────────────────────────────────────────
hi("Pmenu", { bg = p.bg2, fg = p.fg })
hi("PmenuSel", { bg = p.bg_sel, fg = p.fg, bold = true })
hi("PmenuSbar", { bg = p.bg3 })
hi("PmenuThumb", { bg = p.muted })
hi("WildMenu", { bg = p.bg_sel, fg = p.fg })

-- ── Folds ─────────────────────────────────────────────────────────────────────
hi("Folded", { bg = p.bg3, fg = p.comment })
hi("FoldColumn", { bg = p.bg, fg = p.comment })
hi("ColorColumn", { bg = p.bg2 })
hi("QuickFixLine", { bg = p.bg_sel, fg = p.fg })

-- ── Messages ──────────────────────────────────────────────────────────────────
hi("ErrorMsg", { fg = p.error, bold = true })
hi("WarningMsg", { fg = p.warn })
hi("ModeMsg", { fg = p.fg, bold = true })
hi("MoreMsg", { fg = p.func })
hi("Question", { fg = p.keyword })

-- ── Misc UI ───────────────────────────────────────────────────────────────────
hi("NonText", { fg = p.comment })
hi("EndOfBuffer", { fg = p.bg3 })
hi("Conceal", { fg = p.comment })
hi("SpecialKey", { fg = p.comment })
hi("Whitespace", { fg = p.border })
hi("Directory", { fg = p.func, bold = true })
hi("Title", { fg = p.fg, bold = true })
hi("MatchParen", { bg = p.bg_sel, fg = p.fg, bold = true, underline = true })

-- ── Diff ──────────────────────────────────────────────────────────────────────
hi("DiffAdd", { bg = "#0d1f0d", fg = p.git_add })
hi("DiffDelete", { bg = "#1f0d0d", fg = p.git_del })
hi("DiffChange", { bg = "#1a1f0a" })
hi("DiffText", { bg = "#2a2f10", fg = p.git_chg, bold = true })
hi("Added", { fg = p.git_add })
hi("Removed", { fg = p.git_del })
hi("Changed", { fg = p.git_chg })

-- ── Spelling ──────────────────────────────────────────────────────────────────
hi("SpellBad", { undercurl = true, sp = p.error })
hi("SpellCap", { undercurl = true, sp = p.warn })
hi("SpellRare", { undercurl = true, sp = p.info })
hi("SpellLocal", { undercurl = true, sp = p.info })

-- ── Syntax ────────────────────────────────────────────────────────────────────
hi("Comment", { fg = p.comment, italic = true })
hi("Constant", { fg = p.constant })
hi("String", { fg = p.string })
hi("Character", { fg = p.string })
hi("Number", { fg = p.number })
hi("Boolean", { fg = p.keyword })
hi("Float", { fg = p.number })
hi("Identifier", { fg = p.fg })
hi("Function", { fg = p.func, bold = true })
hi("Statement", { fg = p.keyword })
hi("Conditional", { fg = p.keyword })
hi("Repeat", { fg = p.keyword })
hi("Label", { fg = p.keyword })
hi("Operator", { fg = p.comment, bold = true })
hi("Keyword", { fg = p.keyword })
hi("Exception", { fg = p.error })
hi("PreProc", { fg = p.preproc })
hi("Include", { fg = p.preproc })
hi("Define", { fg = p.preproc })
hi("Macro", { fg = p.preproc })
hi("PreCondit", { fg = p.preproc })
hi("Type", { fg = p.type })
hi("StorageClass", { fg = p.type })
hi("Structure", { fg = p.type })
hi("Typedef", { fg = p.type })
hi("Special", { fg = p.special })
hi("SpecialChar", { fg = p.special })
hi("Tag", { fg = p.special })
hi("Delimiter", { fg = p.subtle })
hi("SpecialComment", { fg = p.muted, bold = true, italic = true })
hi("Debug", { fg = p.warn })
hi("Underlined", { underline = true })
hi("Bold", { bold = true })
hi("Italic", { italic = true })
hi("Ignore", { fg = p.comment })
hi("Error", { fg = p.error, bold = true })
hi("Todo", { fg = p.fg, bg = p.bg_sel, bold = true })

-- ── Treesitter ────────────────────────────────────────────────────────────────
hi("@variable", { fg = p.fg })
hi("@variable.builtin", { fg = p.keyword })
hi("@variable.parameter", { fg = p.fg_dark })
hi("@variable.member", { fg = p.fg })
hi("@constant", { fg = p.constant })
hi("@constant.builtin", { fg = p.keyword })
hi("@constant.macro", { fg = p.preproc })
hi("@module", { fg = p.type })
hi("@label", { fg = p.keyword })
hi("@string", { fg = p.string })
hi("@string.escape", { fg = p.special })
hi("@string.special", { fg = p.special })
hi("@string.regexp", { fg = p.special })
hi("@character", { fg = p.string })
hi("@number", { fg = p.number })
hi("@number.float", { fg = p.number })
hi("@boolean", { fg = p.keyword })
hi("@type", { fg = p.type })
hi("@type.builtin", { fg = p.type, italic = true })
hi("@type.definition", { fg = p.type })
hi("@attribute", { fg = p.preproc })
hi("@property", { fg = p.fg_dark })
hi("@function", { fg = p.func, bold = true })
hi("@function.builtin", { fg = p.func, bold = true })
hi("@function.call", { fg = p.func })
hi("@function.macro", { fg = p.preproc })
hi("@function.method", { fg = p.func })
hi("@function.method.call", { fg = p.func })
hi("@constructor", { fg = p.type })
hi("@keyword", { fg = p.keyword })
hi("@keyword.conditional", { fg = p.keyword })
hi("@keyword.coroutine", { fg = p.keyword })
hi("@keyword.debug", { fg = p.warn })
hi("@keyword.directive", { fg = p.preproc })
hi("@keyword.exception", { fg = p.error })
hi("@keyword.function", { fg = p.keyword })
hi("@keyword.import", { fg = p.preproc })
hi("@keyword.modifier", { fg = p.keyword })
hi("@keyword.operator", { fg = p.keyword })
hi("@keyword.repeat", { fg = p.keyword })
hi("@keyword.return", { fg = p.keyword })
hi("@keyword.type", { fg = p.keyword })
hi("@operator", { fg = p.subtle })
hi("@punctuation.delimiter", { fg = p.subtle })
hi("@punctuation.bracket", { fg = p.subtle })
hi("@punctuation.special", { fg = p.special })
hi("@comment", { fg = p.comment, italic = true })
hi("@comment.documentation", { fg = p.muted, italic = true })
hi("@comment.error", { fg = p.error, bold = true, italic = true })
hi("@comment.warning", { fg = p.warn, bold = true, italic = true })
hi("@comment.todo", { fg = p.fg, bg = p.bg_sel, bold = true })
hi("@comment.note", { fg = p.info })
hi("@markup.heading", { fg = p.fg, bold = true })
hi("@markup.heading.1", { fg = p.func, bold = true })
hi("@markup.heading.2", { fg = p.type, bold = true })
hi("@markup.italic", { italic = true })
hi("@markup.strong", { bold = true })
hi("@markup.strikethrough", { strikethrough = true })
hi("@markup.underline", { underline = true })
hi("@markup.link", { fg = p.func })
hi("@markup.link.url", { fg = p.string, underline = true })
hi("@markup.raw", { fg = p.special })
hi("@markup.list", { fg = p.keyword })
hi("@markup.list.checked", { fg = p.git_add })
hi("@markup.list.unchecked", { fg = p.comment })
hi("@tag", { fg = p.keyword })
hi("@tag.attribute", { fg = p.type })
hi("@tag.delimiter", { fg = p.subtle })

-- ── LSP ───────────────────────────────────────────────────────────────────────
hi("DiagnosticError", { fg = p.error })
hi("DiagnosticWarn", { fg = p.warn })
hi("DiagnosticInfo", { fg = p.info })
hi("DiagnosticHint", { fg = p.muted })
hi("DiagnosticOk", { fg = p.git_add })
hi("DiagnosticUnderlineError", { undercurl = true, sp = p.error })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = p.warn })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = p.info })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = p.muted })
hi("DiagnosticVirtualTextError", { fg = p.error, bg = "#1f0d0d" })
hi("DiagnosticVirtualTextWarn", { fg = p.warn, bg = "#1a1f0a" })
hi("DiagnosticVirtualTextInfo", { fg = p.info, bg = "#0d1a0d" })
hi("DiagnosticVirtualTextHint", { fg = p.muted, bg = p.bg3 })
hi("DiagnosticFloatingError", { fg = p.error })
hi("DiagnosticFloatingWarn", { fg = p.warn })
hi("DiagnosticFloatingInfo", { fg = p.info })
hi("DiagnosticFloatingHint", { fg = p.muted })
hi("LspReferenceText", { bg = p.bg_sel })
hi("LspReferenceRead", { bg = p.bg_sel })
hi("LspReferenceWrite", { bg = p.bg_sel, bold = true })
hi("LspSignatureActiveParameter", { fg = p.string, bold = true, underline = true })
hi("LspInlayHint", { fg = p.comment, bg = p.bg3 })
hi("LspCodeLens", { fg = p.muted })

-- ── Telescope ─────────────────────────────────────────────────────────────────
hi("TelescopeNormal", { bg = p.bg2, fg = p.fg })
hi("TelescopeBorder", { bg = p.bg2, fg = p.border })
hi("TelescopePromptBorder", { bg = p.bg3, fg = p.fg })
hi("TelescopePromptNormal", { bg = p.bg3, fg = p.fg })
hi("TelescopePromptPrefix", { bg = p.bg3, fg = p.func, bold = true })
hi("TelescopeResultsBorder", { bg = p.bg2, fg = p.border })
hi("TelescopePreviewBorder", { bg = p.bg2, fg = p.border })
hi("TelescopeMatching", { fg = p.string, bold = true })
hi("TelescopeSelection", { bg = p.bg_sel, fg = p.fg })
hi("TelescopeSelectionCaret", { fg = p.func, bold = true })
hi("TelescopeTitle", { fg = p.fg, bold = true })

-- ── nvim-tree ─────────────────────────────────────────────────────────────────
hi("NvimTreeNormal", { bg = p.bg3, fg = p.fg })
hi("NvimTreeNormalNC", { bg = p.bg3, fg = p.subtle })
hi("NvimTreeWinSeparator", { bg = p.bg3, fg = p.border })
hi("NvimTreeFolderName", { fg = p.func })
hi("NvimTreeOpenedFolderName", { fg = p.func, bold = true })
hi("NvimTreeRootFolder", { fg = p.keyword, bold = true })
hi("NvimTreeGitDirty", { fg = p.git_chg })
hi("NvimTreeGitNew", { fg = p.git_add })
hi("NvimTreeGitDeleted", { fg = p.git_del })
hi("NvimTreeIndentMarker", { fg = p.border })
hi("NvimTreeSymlink", { fg = p.special })
hi("NvimTreeExecFile", { fg = p.func, bold = true })

-- ── GitSigns ──────────────────────────────────────────────────────────────────
hi("GitSignsAdd", { fg = p.git_add })
hi("GitSignsChange", { fg = p.git_chg })
hi("GitSignsDelete", { fg = p.git_del })
hi("GitSignsAddLn", { bg = "#0d1f0d" })
hi("GitSignsChangeLn", { bg = "#1a1f0a" })
hi("GitSignsDeleteLn", { bg = "#1f0d0d" })

-- ── Which-key ─────────────────────────────────────────────────────────────────
hi("WhichKey", { fg = p.keyword, bold = true })
hi("WhichKeyGroup", { fg = p.type })
hi("WhichKeyDesc", { fg = p.fg })
hi("WhichKeySeparator", { fg = p.comment })
hi("WhichKeyFloat", { bg = p.bg2 })

-- ── Indent Blankline ──────────────────────────────────────────────────────────
hi("IblIndent", { fg = p.border })
hi("IblScope", { fg = p.muted })

-- ── nvim-cmp ──────────────────────────────────────────────────────────────────
hi("CmpItemAbbr", { fg = p.fg })
hi("CmpItemAbbrDeprecated", { fg = p.subtle, strikethrough = true })
hi("CmpItemAbbrMatch", { fg = p.string, bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = p.string, bold = true })
hi("CmpItemKind", { fg = p.type })
hi("CmpItemMenu", { fg = p.comment })
hi("CmpDocumentation", { bg = p.bg2 })
hi("CmpDocumentationBorder", { bg = p.bg2, fg = p.border })

-- ── Flash.nvim ────────────────────────────────────────────────────────────────
hi("FlashLabel", { bg = p.string, fg = p.bg, bold = true })
hi("FlashMatch", { bg = p.bg_sel, fg = p.fg })
hi("FlashCurrent", { bg = p.search, fg = p.search_fg, bold = true })

-- ── Noice ─────────────────────────────────────────────────────────────────────
hi("NoiceFormatProgressDone", { bg = p.func, fg = p.bg })
hi("NoiceFormatProgressTodo", { bg = p.bg3, fg = p.comment })
hi("NoiceLspProgressSpinner", { fg = p.func })

-- ── Snacks.nvim ───────────────────────────────────────────────────────────────
hi("SnacksDashboardHeader", { fg = p.func, bold = true })
hi("SnacksDashboardDesc", { fg = p.fg })
hi("SnacksDashboardKey", { fg = p.keyword, bold = true })
hi("SnacksDashboardIcon", { fg = p.type })
hi("SnacksDashboardFooter", { fg = p.comment, italic = true })
hi("SnacksPickerBorder", { fg = p.border })
hi("SnacksPickerMatch", { fg = p.string, bold = true })
hi("SnacksPickerSelected", { bg = p.bg_sel })
