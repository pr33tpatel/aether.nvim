-- lua/aether/palette.lua
-- All colors derived from the vague.nvim fork + personal overrides.
-- To add a light variant, add M.light = { ... } and wire it up in init.lua.

local M = {}

M.dark = {
  -- Backgrounds
  bg          = "#141415",
  inactive_bg = "#1c1c24",
  line        = "#252530",   -- cursorline / active line bg

  -- Foreground
  fg          = "#cdcdcd",

  -- Comments & borders
  comment     = "#606079",
  float_border = "#878787",

  -- Syntax
  builtin     = "#b4d4cf",   -- built-in constants / functions
  func        = "#e462a2",   -- functions (was #c48282, overridden)
  string      = "#af99ff",   -- strings (was #e8b589, overridden)
  number      = "#8f729e",   -- numbers (was #e0a363, overridden)
  property    = "#c3c3d5",   -- object properties / fields
  constant    = "#aeaed1",   -- constants
  parameter   = "#bb9dbd",   -- function parameters
  keyword     = "#8be9fd",   -- keywords (was #6e94b2, overridden)
  operator    = "#90a0b5",   -- operators
  type        = "#9bb4bc",   -- types / interfaces

  -- Variables
  variables   = "#ffffff",   -- variables (was fg, overridden to white)

  -- UI accents
  visual      = "#333738",   -- visual selection bg
  search      = "#405065",   -- search highlight bg
  error       = "#d8647e",   -- errors
  warning     = "#f3be7c",   -- warnings
  hint        = "#7e98e8",   -- hints
  info        = "#7e98e8",   -- info (same as hint)

  -- Diff
  plus        = "#7fa563",   -- diff add
  delta       = "#f3be7c",   -- diff change
  minus       = "#d8647e",   -- diff delete (reuses error)

  -- Special
  none        = "NONE",
}

return M
