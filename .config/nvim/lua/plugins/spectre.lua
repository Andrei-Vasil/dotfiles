return {
	{
		"nvim-pack/nvim-spectre",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("spectre").setup({
				find_engine = {
					-- rg is map with finder_cmd
					["rg"] = {
						cmd = "rg",
						args = {
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
              "--multiline",
						},
						options = {
							["ignore-case"] = {
								value = "--ignore-case",
								icon = "[I]",
								desc = "ignore case",
							},
							["hidden"] = {
								value = "--hidden",
								desc = "hidden file",
								icon = "[H]",
							},
						},
					},
				},
				replace_engine = {
					["sed"] = {
						cmd = "sed",
						args = nil,
						options = {
							["ignore-case"] = {
								value = "--ignore-case",
								icon = "[I]",
								desc = "ignore case",
							},
						},
					},
				},
			})

			vim.keymap.set("n", "<leader>st", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
			vim.keymap.set(
				"n",
				"<leader>sw",
				'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
				{ desc = "Search current word" }
			)
			vim.keymap.set(
				"v",
				"<leader>sw",
				'<esc><cmd>lua require("spectre").open_visual()<CR>',
				{ desc = "Search current word" }
			)
			vim.keymap.set(
				"n",
				"<leader>sp",
				'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
				{ desc = "Search on current file" }
			)
		end,
	},
}
