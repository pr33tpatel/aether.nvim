# aether.nvim

> A dark Neovim colorscheme forked from [vague.nvim](https://github.com/vague-theme/vague.nvim)
> with a personal palette: cyan keywords, pink functions, lavender strings, and a near-black background.

## Palette

| Role        | Color     | Preview |
|-------------|-----------|---------|
| Background  | `#141415` | ██ |
| Foreground  | `#cdcdcd` | ██ |
| Keywords    | `#8be9fd` | ██ cyan |
| Functions   | `#e462a2` | ██ pink/magenta |
| Strings     | `#af99ff` | ██ lavender |
| Numbers     | `#8f729e` | ██ muted purple |
| Variables   | `#ffffff` | ██ white |
| Types       | `#9bb4bc` | ██ steel blue |
| Builtins    | `#b4d4cf` | ██ teal |
| Comments    | `#606079` | ██ muted slate |
| Error       | `#d8647e` | ██ rose |
| Warning     | `#f3be7c` | ██ amber |
| Hint        | `#7e98e8` | ██ periwinkle |

## Requirements

- Neovim ≥ 0.8 (for `@`-prefixed treesitter groups)
- `termguicolors` enabled (handled automatically)

## Installation

### lazy.nvim

```lua
{
  "your-username/aether.nvim",
  priority = 1000,   -- load before other plugins
  config = function()
    require("aether").setup({
      transparent = true,
      bold        = false,
      italic      = true,
      style = {
        comments       = "italic",
        error          = "italic",
        keyword_return = "italic",
        -- all other styles default to "none"
      },
    })
    vim.cmd("colorscheme aether")
  end,
}
```

### packer.nvim

```lua
use {
  "your-username/aether.nvim",
  config = function()
    require("aether").setup({})
    vim.cmd("colorscheme aether")
  end,
}
```

### vim-plug

```vim
Plug 'your-username/aether.nvim'
lua require("aether").setup({})
colorscheme aether
```

## Configuration

`setup()` accepts the full options table below. All keys are optional.

```lua
require("aether").setup({
  transparent = true,    -- remove background (good for terminal transparency)
  bold        = false,   -- master bold toggle (does not affect style overrides)
  italic      = true,    -- master italic toggle (does not affect style overrides)

  style = {
    -- Syntax groups — accepted values: "none" | "italic" | "bold"
    boolean            = "none",
    number             = "none",
    float              = "none",
    error              = "italic",
    comments           = "italic",
    conditionals       = "none",
    functions          = "none",
    headings           = "none",
    operators          = "none",
    strings            = "none",
    variables          = "none",

    -- Keyword variants
    keywords           = "none",
    keyword_return     = "italic",
    keywords_loop      = "none",
    keywords_label     = "none",
    keywords_exception = "none",

    -- Built-ins
    builtin_constants  = "none",
    builtin_functions  = "none",
    builtin_types      = "none",
    builtin_variables  = "none",
  },
})
```

## Covered Highlight Groups

- **Editor UI** — Normal, CursorLine, Pmenu, StatusLine, WinSeparator, etc.
- **Base syntax** — all standard Vim `syn-` groups
- **Treesitter** — all `@`-prefixed groups (Neovim 0.8+)
- **LSP semantic tokens** — `@lsp.type.*` and `@lsp.mod.*`
- **Diagnostics** — virtual text, underline, sign column
- **Diff / GitSigns**
- **Plugins** — Telescope, nvim-tree, neo-tree, which-key, nvim-cmp, blink.cmp,
  indent-blankline, Trouble, Lazy, Mason, nvim-notify, mini.nvim, Alpha/Dashboard

## Credits

Palette and structure forked from [vague.nvim](https://github.com/vague-theme/vague.nvim).
