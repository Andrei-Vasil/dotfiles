return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      custom_highlights = function(colors)
        return {
          LineNr = { fg = colors.subtext1 },
        }
      end,
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
