return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  opts = {
    picker = "telescope",
    file_panel = {
      icons = function(name, _ext)
        return require("mini.icons").get("file", name)
      end,
    },
    -- bare Octo command opens picker of commands
    enable_builtin = true,
  },
  keys = {
    {
      "<leader>oi",
      "<CMD>Octo issue list<CR>",
      desc = "List GitHub Issues",
    },
    {
      "<leader>ops",
      "<CMD>Octo pr list<CR>",
      desc = "List GitHub PullRequests",
    },
    {
      "<leader>od",
      "<CMD>Octo discussion list<CR>",
      desc = "List GitHub Discussions",
    },
    {
      "<leader>on",
      "<CMD>Octo notification list<CR>",
      desc = "List GitHub Notifications",
    },
    {
      "<leader>os",
      function()
        require("octo.utils").create_base_search_command({ include_current_repo = true })
      end,
      desc = "Search GitHub",
    },
    {
      "<leader>opc",
      function()
        local n = vim.fn.system({ "gh", "pr", "view", "--json", "number", "-q", ".number" }):gsub("%s+", "")
        if vim.v.shell_error ~= 0 or n == "" then
          vim.notify("No open PR for this branch", vim.log.levels.WARN)
          return
        end
        vim.cmd("Octo pr edit " .. n)
      end,
      desc = "Open PR for current branch",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
