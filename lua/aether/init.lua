-- lua/aether/init.lua
-- Public API. Call require("aether").setup({}) before loading the colorscheme,
-- or let the colors/ entry point use the defaults.

local M = {}

-- Default config — mirrors the original vague.nvim setup block.
M.config = {
  transparent = true,
  bold        = false,
  italic      = true,
  style = {
    boolean             = "none",
    number              = "none",
    float               = "none",
    error               = "italic",
    comments            = "italic",
    conditionals        = "none",
    functions           = "none",
    headings            = "none",
    operators           = "none",
    strings             = "none",
    variables           = "none",
    -- keywords
    keywords            = "none",
    keyword_return      = "italic",
    keywords_loop       = "none",
    keywords_label      = "none",
    keywords_exception  = "none",
    -- builtins
    builtin_constants   = "none",
    builtin_functions   = "none",
    builtin_types       = "none",
    builtin_variables   = "none",
  },
}

--- Override any default config values.
--- Call this BEFORE `load()` or `:colorscheme aether`.
---@param opts table|nil
function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

--- Apply the colorscheme. Called automatically from colors/aether.lua.
function M.load()
  if vim.version().minor < 8 then
    vim.notify(
      "[aether] Neovim ≥ 0.8 is required for full treesitter support.",
      vim.log.levels.WARN
    )
  end

  vim.o.termguicolors = true

  local palette = require("aether.palette")
  local colors  = palette.dark   -- swap to palette.light when you add a light variant

  require("aether.highlights").setup(colors, M.config)
end

return M
