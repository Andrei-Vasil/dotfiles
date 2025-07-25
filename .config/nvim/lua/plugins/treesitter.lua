return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "OXY2DEV/markview.nvim" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "javascript",
        "terraform",
        "go",
        "gomod",
        "gosum",
        "python",
        "vim",
        "terraform",
        "helm",
        "yaml",
        -- OXY2DEV/markview.nvim requirements:
        "markdown",
        "markdown_inline",
        "yaml",  -- optional, but required for lsp
        "html",  -- optional
        "latex", -- optional
        "typst", -- optional
      },
      sync_install = true,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
