local options = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "go",
    "rust",
    "dockerfile",
    "haskell",
    "python",
    "zig",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline"
  },

  vim.filetype.add {
    extension = { rasi = 'rasi' },
    pattern = {
      ['.*/waybar/config'] = 'jsonc',
      ['.*/mako/config'] = 'dosini',
      ['.*/kitty/*.conf'] = 'bash',
      ['.*/hypr/.*%.conf'] = 'hyprlang',
    },
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
