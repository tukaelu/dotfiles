return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "go",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "yaml",
      },
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      disable = {},
    },
  },
}
