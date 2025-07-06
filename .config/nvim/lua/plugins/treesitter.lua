return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "javascript",
        "terraform",
        "go",
        "python",
        "yaml",
        "markdown",
        "vim",
        "terraform",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
