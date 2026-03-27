-- lua/aether/highlights.lua
-- Sets all highlight groups using vim.api.nvim_set_hl.
-- Mirrors + extends what vague.nvim covers, using the personal palette.

local M = {}

function M.setup(c, opts)
  local hl = function(name, val)
    vim.api.nvim_set_hl(0, name, val)
  end

  -- Resolve style strings ("italic" / "bold" / "none") into attribute tables.
  local function style(s)
    if s == "italic" then return { italic = true }
    elseif s == "bold" then return { bold = true }
    else return {}
    end
  end

  -- Merge two tables (b overwrites a).
  local function merge(a, b)
    local t = {}
    for k, v in pairs(a) do t[k] = v end
    for k, v in pairs(b) do t[k] = v end
    return t
  end

  local bg = opts.transparent and c.none or c.bg

  -- ─────────────────────────────────────────────────────────────
  -- EDITOR UI
  -- ─────────────────────────────────────────────────────────────
  hl("Normal",           { fg = c.fg,           bg = bg })
  hl("NormalNC",         { fg = c.fg,           bg = opts.transparent and c.none or c.inactive_bg })
  hl("NormalFloat",      { fg = c.fg,           bg = opts.transparent and c.none or c.inactive_bg })
  hl("FloatBorder",      { fg = c.float_border, bg = opts.transparent and c.none or c.inactive_bg })
  hl("FloatTitle",       { fg = c.fg,           bold = not opts.bold and false or true })

  hl("CursorLine",       { bg = c.line })
  hl("CursorLineNr",     { fg = c.fg,           bg = c.line })
  hl("CursorColumn",     { bg = c.line })
  hl("Cursor",           { reverse = true })
  hl("CursorIM",         { reverse = true })
  hl("TermCursor",       { reverse = true })

  hl("LineNr",           { fg = c.comment })
  hl("SignColumn",       { bg = bg })
  hl("ColorColumn",      { bg = c.inactive_bg })
  hl("FoldColumn",       { fg = c.comment,      bg = bg })
  hl("Folded",           { fg = c.comment,      bg = c.inactive_bg })

  hl("WinSeparator",     { fg = c.line })
  hl("VertSplit",        { fg = c.line })
  hl("StatusLine",       { fg = c.fg,           bg = c.inactive_bg })
  hl("StatusLineNC",     { fg = c.comment,      bg = c.inactive_bg })
  hl("TabLine",          { fg = c.comment,      bg = c.inactive_bg })
  hl("TabLineFill",      { bg = c.inactive_bg })
  hl("TabLineSel",       { fg = c.fg,           bg = c.bg })

  hl("WildMenu",         { fg = c.bg,           bg = c.keyword })
  hl("Pmenu",            { fg = c.fg,           bg = c.inactive_bg })
  hl("PmenuSel",         { fg = c.bg,           bg = c.fg })
  hl("PmenuSbar",        { bg = c.inactive_bg })
  hl("PmenuThumb",       { bg = c.comment })
  hl("PmenuBorder",      { fg = c.float_border, bg = c.inactive_bg })

  hl("Visual",           { bg = c.visual })
  hl("VisualNOS",        { bg = c.visual })
  hl("Search",           { fg = c.fg,           bg = c.search })
  hl("IncSearch",        { fg = c.bg,           bg = c.keyword })
  hl("CurSearch",        { fg = c.bg,           bg = c.keyword })
  hl("Substitute",       { fg = c.bg,           bg = c.func })

  hl("MatchParen",       { fg = c.fg,           bold = true, underline = true })
  hl("NonText",          { fg = c.line })
  hl("Whitespace",       { fg = c.line })
  hl("SpecialKey",       { fg = c.comment })
  hl("EndOfBuffer",      { fg = c.inactive_bg })
  hl("Directory",        { fg = c.builtin })
  hl("Title",            { fg = c.fg,           bold = not opts.bold and false or true })
  hl("Conceal",          { fg = c.comment })
  hl("Ignore",           { fg = c.comment })
  hl("Question",         { fg = c.builtin })
  hl("MoreMsg",          { fg = c.builtin })
  hl("ModeMsg",          { fg = c.fg })
  hl("ErrorMsg",         { fg = c.error })
  hl("WarningMsg",       { fg = c.warning })
  hl("SpellBad",         { undercurl = true, sp = c.error })
  hl("SpellCap",         { undercurl = true, sp = c.warning })
  hl("SpellRare",        { undercurl = true, sp = c.hint })
  hl("SpellLocal",       { undercurl = true, sp = c.info })

  -- ─────────────────────────────────────────────────────────────
  -- BASE SYNTAX
  -- ─────────────────────────────────────────────────────────────
  hl("Comment",      merge({ fg = c.comment }, style(opts.style.comments)))
  hl("String",       merge({ fg = c.string },  style(opts.style.strings)))
  hl("Number",       merge({ fg = c.number },  style(opts.style.number)))
  hl("Float",        merge({ fg = c.number },  style(opts.style.float)))
  hl("Boolean",      merge({ fg = c.builtin }, style(opts.style.boolean)))
  hl("Constant",     { fg = c.constant })
  hl("Character",    { fg = c.string })

  hl("Identifier",   merge({ fg = c.variables }, style(opts.style.variables)))
  hl("Function",     merge({ fg = c.func },     style(opts.style.functions)))
  hl("Operator",     merge({ fg = c.operator }, style(opts.style.operators)))
  hl("Type",         { fg = c.type })
  hl("TypeDef",      { fg = c.type })
  hl("StorageClass", { fg = c.keyword })
  hl("Structure",    { fg = c.type })

  hl("Keyword",      merge({ fg = c.keyword }, style(opts.style.keywords)))
  hl("Statement",    merge({ fg = c.keyword }, style(opts.style.keywords)))
  hl("Conditional",  merge({ fg = c.keyword }, style(opts.style.conditionals)))
  hl("Repeat",       merge({ fg = c.keyword }, style(opts.style.keywords_loop)))
  hl("Label",        merge({ fg = c.keyword }, style(opts.style.keywords_label)))
  hl("Exception",    merge({ fg = c.keyword }, style(opts.style.keywords_exception)))

  hl("PreProc",      { fg = c.builtin })
  hl("Include",      { fg = c.builtin })
  hl("Define",       { fg = c.builtin })
  hl("Macro",        { fg = c.builtin })
  hl("PreCondit",    { fg = c.builtin })

  hl("Special",      { fg = c.builtin })
  hl("SpecialChar",  { fg = c.string })
  hl("Tag",          { fg = c.func })
  hl("Delimiter",    { fg = c.fg })
  hl("SpecialComment", { fg = c.comment, italic = true })
  hl("Debug",        { fg = c.warning })

  hl("Error",        merge({ fg = c.error }, style(opts.style.error)))
  hl("Todo",         { fg = c.warning, bold = true })
  hl("Underlined",   { underline = true })

  -- ─────────────────────────────────────────────────────────────
  -- TREESITTER  (@-groups, Neovim ≥ 0.8)
  -- Most link to base groups to avoid duplication.
  -- Override individually if you want fine-grained control.
  -- ─────────────────────────────────────────────────────────────

  -- Literals
  hl("@string",                { link = "String" })
  hl("@string.escape",         { fg = c.builtin })
  hl("@string.special",        { fg = c.builtin })
  hl("@string.regexp",         { fg = c.string, italic = true })
  hl("@number",                { link = "Number" })
  hl("@number.float",          { link = "Float" })
  hl("@boolean",               { link = "Boolean" })
  hl("@character",             { link = "Character" })
  hl("@character.special",     { fg = c.builtin })

  -- Comments
  hl("@comment",               { link = "Comment" })
  hl("@comment.documentation", { fg = c.comment, italic = true })
  hl("@comment.todo",          { fg = c.warning, bold = true })
  hl("@comment.note",          { fg = c.hint, bold = true })
  hl("@comment.warning",       { fg = c.warning, bold = true })
  hl("@comment.error",         { fg = c.error, bold = true })

  -- Functions
  hl("@function",              merge({ fg = c.func },    style(opts.style.functions)))
  hl("@function.call",         merge({ fg = c.func },    style(opts.style.functions)))
  hl("@function.builtin",      merge({ fg = c.builtin }, style(opts.style.builtin_functions)))
  hl("@function.macro",        { fg = c.builtin })
  hl("@function.method",       merge({ fg = c.func },    style(opts.style.functions)))
  hl("@function.method.call",  merge({ fg = c.func },    style(opts.style.functions)))
  hl("@constructor",           { fg = c.type })

  -- Keywords
  hl("@keyword",               merge({ fg = c.keyword }, style(opts.style.keywords)))
  hl("@keyword.function",      merge({ fg = c.keyword }, style(opts.style.keywords)))
  hl("@keyword.return",        merge({ fg = c.keyword }, style(opts.style.keyword_return)))
  hl("@keyword.operator",      merge({ fg = c.keyword }, style(opts.style.operators)))
  hl("@keyword.import",        merge({ fg = c.builtin }, style(opts.style.keywords)))
  hl("@keyword.modifier",      merge({ fg = c.keyword }, style(opts.style.keywords)))
  hl("@keyword.repeat",        merge({ fg = c.keyword }, style(opts.style.keywords_loop)))
  hl("@keyword.conditional",   merge({ fg = c.keyword }, style(opts.style.conditionals)))
  hl("@keyword.exception",     merge({ fg = c.keyword }, style(opts.style.keywords_exception)))
  hl("@keyword.directive",     { fg = c.builtin })

  -- Variables & identifiers
  hl("@variable",              merge({ fg = c.variables }, style(opts.style.variables)))
  hl("@variable.builtin",      merge({ fg = c.builtin },  style(opts.style.builtin_variables)))
  hl("@variable.parameter",    { fg = c.parameter })
  hl("@variable.member",       { fg = c.property })

  -- Types
  hl("@type",                  { link = "Type" })
  hl("@type.builtin",          merge({ fg = c.builtin }, style(opts.style.builtin_types)))
  hl("@type.definition",       { fg = c.type })
  hl("@type.qualifier",        merge({ fg = c.keyword }, style(opts.style.keywords)))

  -- Attributes / annotations
  hl("@attribute",             { fg = c.builtin })
  hl("@attribute.builtin",     { fg = c.builtin })

  -- Namespaces & labels
  hl("@module",                { fg = c.builtin })
  hl("@module.builtin",        { fg = c.builtin })
  hl("@label",                 merge({ fg = c.keyword }, style(opts.style.keywords_label)))

  -- Operators & punctuation
  hl("@operator",              merge({ fg = c.operator }, style(opts.style.operators)))
  hl("@punctuation",           { fg = c.fg })
  hl("@punctuation.bracket",   { fg = c.fg })
  hl("@punctuation.delimiter", { fg = c.fg })
  hl("@punctuation.special",   { fg = c.builtin })

  -- Properties & constants
  hl("@property",              { fg = c.property })
  hl("@constant",              { fg = c.constant })
  hl("@constant.builtin",      merge({ fg = c.builtin }, style(opts.style.builtin_constants)))
  hl("@constant.macro",        { fg = c.builtin })

  -- Markup (for markdown etc.)
  hl("@markup.raw",            { fg = c.string })
  hl("@markup.link",           { fg = c.hint, underline = true })
  hl("@markup.link.label",     { fg = c.func })
  hl("@markup.link.url",       { fg = c.hint, underline = true })
  hl("@markup.heading",        merge({ fg = c.fg }, style(opts.style.headings)))
  hl("@markup.strong",         { bold = true })
  hl("@markup.italic",         { italic = true })
  hl("@markup.strikethrough",  { strikethrough = true })
  hl("@markup.quote",          { fg = c.comment, italic = true })
  hl("@markup.list",           { fg = c.keyword })
  hl("@markup.math",           { fg = c.builtin })

  -- Tags (HTML/JSX)
  hl("@tag",                   { fg = c.keyword })
  hl("@tag.builtin",           { fg = c.builtin })
  hl("@tag.attribute",         { fg = c.property })
  hl("@tag.delimiter",         { fg = c.operator })

  -- Diff (treesitter)
  hl("@diff.plus",             { fg = c.plus })
  hl("@diff.minus",            { fg = c.minus })
  hl("@diff.delta",            { fg = c.delta })

  -- ─────────────────────────────────────────────────────────────
  -- LSP SEMANTIC TOKENS
  -- ─────────────────────────────────────────────────────────────
  hl("@lsp.type.class",          { fg = c.type })
  hl("@lsp.type.comment",        { link = "Comment" })
  hl("@lsp.type.decorator",      { fg = c.builtin })
  hl("@lsp.type.enum",           { fg = c.type })
  hl("@lsp.type.enumMember",     { fg = c.constant })
  hl("@lsp.type.function",       merge({ fg = c.func }, style(opts.style.functions)))
  hl("@lsp.type.interface",      { fg = c.type })
  hl("@lsp.type.keyword",        merge({ fg = c.keyword }, style(opts.style.keywords)))
  hl("@lsp.type.macro",          { fg = c.builtin })
  hl("@lsp.type.method",         merge({ fg = c.func }, style(opts.style.functions)))
  hl("@lsp.type.namespace",      { fg = c.builtin })
  hl("@lsp.type.number",         { link = "Number" })
  hl("@lsp.type.operator",       { link = "Operator" })
  hl("@lsp.type.parameter",      { fg = c.parameter })
  hl("@lsp.type.property",       { fg = c.property })
  hl("@lsp.type.regexp",         { fg = c.string, italic = true })
  hl("@lsp.type.string",         { link = "String" })
  hl("@lsp.type.struct",         { fg = c.type })
  hl("@lsp.type.type",           { fg = c.type })
  hl("@lsp.type.typeParameter",  { fg = c.type })
  hl("@lsp.type.variable",       merge({ fg = c.variables }, style(opts.style.variables)))

  -- LSP modifier overrides
  hl("@lsp.mod.readonly",        { fg = c.constant })
  hl("@lsp.mod.static",          { fg = c.builtin })
  hl("@lsp.mod.deprecated",      { fg = c.comment, strikethrough = true })
  hl("@lsp.mod.defaultLibrary",  { fg = c.builtin })

  -- ─────────────────────────────────────────────────────────────
  -- DIAGNOSTICS
  -- ─────────────────────────────────────────────────────────────
  hl("DiagnosticError",            { fg = c.error })
  hl("DiagnosticWarn",             { fg = c.warning })
  hl("DiagnosticInfo",             { fg = c.info })
  hl("DiagnosticHint",             { fg = c.hint })
  hl("DiagnosticOk",               { fg = c.plus })
  hl("DiagnosticUnnecessary",      { fg = c.comment })
  hl("DiagnosticDeprecated",       { fg = c.comment, strikethrough = true })

  hl("DiagnosticVirtualTextError", { fg = c.error })
  hl("DiagnosticVirtualTextWarn",  { fg = c.warning })
  hl("DiagnosticVirtualTextInfo",  { fg = c.info })
  hl("DiagnosticVirtualTextHint",  { fg = c.hint })

  hl("DiagnosticUnderlineError",   { undercurl = true, sp = c.error })
  hl("DiagnosticUnderlineWarn",    { undercurl = true, sp = c.warning })
  hl("DiagnosticUnderlineInfo",    { undercurl = true, sp = c.info })
  hl("DiagnosticUnderlineHint",    { undercurl = true, sp = c.hint })

  hl("DiagnosticSignError",        { fg = c.error })
  hl("DiagnosticSignWarn",         { fg = c.warning })
  hl("DiagnosticSignInfo",         { fg = c.info })
  hl("DiagnosticSignHint",         { fg = c.hint })

  -- ─────────────────────────────────────────────────────────────
  -- GIT SIGNS / DIFF
  -- ─────────────────────────────────────────────────────────────
  hl("DiffAdd",     { fg = c.plus,  bg = opts.transparent and c.none or "#1a2b1a" })
  hl("DiffDelete",  { fg = c.minus, bg = opts.transparent and c.none or "#2b1a1a" })
  hl("DiffChange",  { fg = c.delta, bg = opts.transparent and c.none or "#2b2b1a" })
  hl("DiffText",    { fg = c.fg,    bg = opts.transparent and c.none or "#3a3a1a" })

  hl("GitSignsAdd",          { fg = c.plus })
  hl("GitSignsChange",       { fg = c.delta })
  hl("GitSignsDelete",       { fg = c.minus })
  hl("GitSignsAddNr",        { fg = c.plus })
  hl("GitSignsChangeNr",     { fg = c.delta })
  hl("GitSignsDeleteNr",     { fg = c.minus })
  hl("GitSignsAddLn",        { bg = opts.transparent and c.none or "#1a2b1a" })
  hl("GitSignsChangeLn",     { bg = opts.transparent and c.none or "#2b2b1a" })
  hl("GitSignsCurrentLineBlame", { fg = c.comment, italic = true })

  -- ─────────────────────────────────────────────────────────────
  -- PLUGIN INTEGRATIONS
  -- ─────────────────────────────────────────────────────────────

  -- Telescope
  hl("TelescopeNormal",          { fg = c.fg,        bg = opts.transparent and c.none or c.inactive_bg })
  hl("TelescopeBorder",          { fg = c.line,      bg = opts.transparent and c.none or c.inactive_bg })
  hl("TelescopePromptBorder",    { fg = c.float_border })
  hl("TelescopePromptNormal",    { fg = c.fg })
  hl("TelescopePromptPrefix",    { fg = c.func })
  hl("TelescopeResultsBorder",   { fg = c.line })
  hl("TelescopePreviewBorder",   { fg = c.line })
  hl("TelescopeSelection",       { fg = c.fg,        bg = c.visual })
  hl("TelescopeSelectionCaret",  { fg = c.func })
  hl("TelescopeMatching",        { fg = c.keyword,   bold = true })
  hl("TelescopeTitle",           { fg = c.fg })

  -- nvim-tree
  hl("NvimTreeNormal",           { fg = c.fg,      bg = opts.transparent and c.none or c.inactive_bg })
  hl("NvimTreeNormalNC",         { fg = c.fg,      bg = opts.transparent and c.none or c.inactive_bg })
  hl("NvimTreeFolderIcon",       { fg = c.builtin })
  hl("NvimTreeFolderName",       { fg = c.fg })
  hl("NvimTreeOpenedFolderName", { fg = c.fg,      bold = true })
  hl("NvimTreeRootFolder",       { fg = c.comment })
  hl("NvimTreeGitNew",           { fg = c.plus })
  hl("NvimTreeGitDirty",         { fg = c.delta })
  hl("NvimTreeGitDeleted",       { fg = c.minus })
  hl("NvimTreeIndentMarker",     { fg = c.line })
  hl("NvimTreeWinSeparator",     { fg = c.line })

  -- neo-tree
  hl("NeoTreeNormal",            { fg = c.fg,       bg = opts.transparent and c.none or c.inactive_bg })
  hl("NeoTreeNormalNC",          { fg = c.fg,       bg = opts.transparent and c.none or c.inactive_bg })
  hl("NeoTreeDimText",           { fg = c.comment })
  hl("NeoTreeIndentMarker",      { fg = c.line })
  hl("NeoTreeDirectoryIcon",     { fg = c.builtin })
  hl("NeoTreeGitAdded",          { fg = c.plus })
  hl("NeoTreeGitModified",       { fg = c.delta })
  hl("NeoTreeGitDeleted",        { fg = c.minus })

  -- which-key
  hl("WhichKey",          { fg = c.func })
  hl("WhichKeyGroup",     { fg = c.keyword })
  hl("WhichKeyDesc",      { fg = c.fg })
  hl("WhichKeySeparator", { fg = c.comment })
  hl("WhichKeyBorder",    { fg = c.line })
  hl("WhichKeyFloat",     { bg = opts.transparent and c.none or c.inactive_bg })

  -- nvim-cmp
  hl("CmpItemAbbr",            { fg = c.fg })
  hl("CmpItemAbbrDeprecated",  { fg = c.comment, strikethrough = true })
  hl("CmpItemAbbrMatch",       { fg = c.keyword, bold = true })
  hl("CmpItemAbbrMatchFuzzy",  { fg = c.keyword })
  hl("CmpItemMenu",            { fg = c.comment })
  hl("CmpItemKindText",        { fg = c.fg })
  hl("CmpItemKindMethod",      { fg = c.func })
  hl("CmpItemKindFunction",    { fg = c.func })
  hl("CmpItemKindConstructor", { fg = c.type })
  hl("CmpItemKindField",       { fg = c.property })
  hl("CmpItemKindVariable",    { fg = c.variables })
  hl("CmpItemKindClass",       { fg = c.type })
  hl("CmpItemKindInterface",   { fg = c.type })
  hl("CmpItemKindModule",      { fg = c.builtin })
  hl("CmpItemKindProperty",    { fg = c.property })
  hl("CmpItemKindUnit",        { fg = c.number })
  hl("CmpItemKindValue",       { fg = c.constant })
  hl("CmpItemKindEnum",        { fg = c.type })
  hl("CmpItemKindKeyword",     { fg = c.keyword })
  hl("CmpItemKindSnippet",     { fg = c.string })
  hl("CmpItemKindColor",       { fg = c.func })
  hl("CmpItemKindFile",        { fg = c.fg })
  hl("CmpItemKindReference",   { fg = c.builtin })
  hl("CmpItemKindFolder",      { fg = c.builtin })
  hl("CmpItemKindEnumMember",  { fg = c.constant })
  hl("CmpItemKindConstant",    { fg = c.constant })
  hl("CmpItemKindStruct",      { fg = c.type })
  hl("CmpItemKindEvent",       { fg = c.warning })
  hl("CmpItemKindOperator",    { fg = c.operator })
  hl("CmpItemKindTypeParameter", { fg = c.type })

  -- blink.cmp (newer completion)
  hl("BlinkCmpMenu",           { fg = c.fg,   bg = opts.transparent and c.none or c.inactive_bg })
  hl("BlinkCmpMenuBorder",     { fg = c.line, bg = opts.transparent and c.none or c.inactive_bg })
  hl("BlinkCmpMenuSelection",  { fg = c.bg,   bg = c.fg })
  hl("BlinkCmpLabelMatch",     { fg = c.keyword, bold = true })

  -- LSP hover / signature
  hl("LspSignatureActiveParameter", { fg = c.parameter, bold = true, underline = true })
  hl("LspReferenceText",            { bg = c.visual })
  hl("LspReferenceRead",            { bg = c.visual })
  hl("LspReferenceWrite",           { bg = c.visual, bold = true })
  hl("LspCodeLens",                 { fg = c.comment, italic = true })
  hl("LspInlayHint",                { fg = c.comment, italic = true, bg = opts.transparent and c.none or c.inactive_bg })

  -- Indent guides (indent-blankline)
  hl("IblIndent",     { fg = c.line })
  hl("IblScope",      { fg = c.comment })
  hl("IndentBlanklineChar",      { fg = c.line })
  hl("IndentBlanklineContextChar", { fg = c.comment })

  -- Trouble
  hl("TroubleNormal",   { fg = c.fg, bg = opts.transparent and c.none or c.inactive_bg })
  hl("TroubleCount",    { fg = c.func })
  hl("TroubleText",     { fg = c.fg })
  hl("TroubleSource",   { fg = c.comment })

  -- Lazy.nvim
  hl("LazyButton",       { fg = c.fg,      bg = c.inactive_bg })
  hl("LazyButtonActive", { fg = c.bg,      bg = c.fg })
  hl("LazyH1",           { fg = c.func,    bold = true })
  hl("LazySpecial",      { fg = c.keyword })

  -- Mason
  hl("MasonNormal",         { fg = c.fg, bg = opts.transparent and c.none or c.inactive_bg })
  hl("MasonHighlight",      { fg = c.keyword })
  hl("MasonHighlightBlock", { fg = c.bg, bg = c.keyword })
  hl("MasonMuted",          { fg = c.comment })
  hl("MasonError",          { fg = c.error })

  -- Notify
  hl("NotifyERRORBorder", { fg = c.error })
  hl("NotifyWARNBorder",  { fg = c.warning })
  hl("NotifyINFOBorder",  { fg = c.info })
  hl("NotifyDEBUGBorder", { fg = c.comment })
  hl("NotifyTRACEBorder", { fg = c.hint })
  hl("NotifyERRORIcon",   { fg = c.error })
  hl("NotifyWARNIcon",    { fg = c.warning })
  hl("NotifyINFOIcon",    { fg = c.info })
  hl("NotifyDEBUGIcon",   { fg = c.comment })
  hl("NotifyTRACEIcon",   { fg = c.hint })
  hl("NotifyERRORTitle",  { fg = c.error,   bold = true })
  hl("NotifyWARNTitle",   { fg = c.warning, bold = true })
  hl("NotifyINFOTitle",   { fg = c.info,    bold = true })
  hl("NotifyDEBUGTitle",  { fg = c.comment, bold = true })
  hl("NotifyTRACETitle",  { fg = c.hint,    bold = true })
  hl("NotifyERRORBody",   { fg = c.fg })
  hl("NotifyWARNBody",    { fg = c.fg })
  hl("NotifyINFOBody",    { fg = c.fg })
  hl("NotifyDEBUGBody",   { fg = c.fg })
  hl("NotifyTRACEBody",   { fg = c.fg })

  -- Mini.nvim (statusline, etc.)
  hl("MiniStatuslineModeNormal",  { fg = c.bg, bg = c.builtin, bold = true })
  hl("MiniStatuslineModeInsert",  { fg = c.bg, bg = c.func,    bold = true })
  hl("MiniStatuslineModeVisual",  { fg = c.bg, bg = c.keyword, bold = true })
  hl("MiniStatuslineModeReplace", { fg = c.bg, bg = c.error,   bold = true })
  hl("MiniStatuslineModeCommand", { fg = c.bg, bg = c.warning, bold = true })
  hl("MiniStatuslineFilename",    { fg = c.fg, bg = c.inactive_bg })
  hl("MiniStatuslineFileinfo",    { fg = c.fg, bg = c.inactive_bg })
  hl("MiniStatuslineInactive",    { fg = c.comment, bg = c.inactive_bg })
  hl("MiniCursorword",            { bg = c.visual, underline = true })
  hl("MiniCursorwordCurrent",     { bg = c.visual, underline = true })
  hl("MiniJump",                  { fg = c.bg, bg = c.func })
  hl("MiniJump2dSpot",            { fg = c.func, bold = true })
  hl("MiniIndentscopeSymbol",     { fg = c.comment })

  -- Dashboard / Alpha
  hl("AlphaHeader",  { fg = c.func })
  hl("AlphaButtons", { fg = c.keyword })
  hl("AlphaShortcut",{ fg = c.builtin })
  hl("AlphaFooter",  { fg = c.comment, italic = true })
  hl("DashboardHeader",  { fg = c.func })
  hl("DashboardFooter",  { fg = c.comment, italic = true })
  hl("DashboardShortCut",{ fg = c.builtin })

  -- Highlight on yank (managed by the user, but set a good base)
  hl("YankFlash", { bg = c.search, fg = c.fg })
end

return M
