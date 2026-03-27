-- colors/aether.lua
-- Neovim's colorscheme entry point.
-- :colorscheme aether  →  this file runs first.

vim.o.background = "dark"
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "aether"

require("aether").load()
