return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<C-_>", function()  -- actual intended use: Ctrl + / (Ctrl + _ also works)
      vim.cmd.Neotree("toggle")
    end, { noremap = true, silent = true, desc = "Toggle Neotree" })
  end
}
