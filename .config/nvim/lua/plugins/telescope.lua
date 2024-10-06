return { 
  "nvim-telescope/telescope.nvim", tag = "0.1.8", 
  dependencies = {
    "nvim-lua/plenary.nvim" 
  },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    local actions = require("telescope.actions")
    require("telescope").setup{
      defaults = {
        mappings = {
          i = {
            ["<C-c>"] = false, -- similar behavior to vim motions
            ["<esc>"] = actions.close,
          }
        }
      }
    }
  end
}
