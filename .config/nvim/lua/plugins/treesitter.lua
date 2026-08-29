return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    require("nvim-treesitter").install({
      "lua",
      "javascript",
      "terraform",
      "go",
      "gomod",
      "gosum",
      "python",
      "vim",
      "helm",
      "yaml",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua",
        "javascript",
        "terraform",
        "go",
        "gomod",
        "gosum",
        "python",
        "vim",
        "helm",
        "yaml",
      },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
