return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- lua
				null_ls.builtins.formatting.stylua,
				-- js
				require("none-ls.diagnostics.eslint"),
				null_ls.builtins.formatting.prettier,
				-- python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				-- shells
				null_ls.builtins.formatting.shfmt.with({
					filetype = { "sh", "zsh" },
				}),
				-- terraform
				null_ls.builtins.formatting.terraform_fmt.with({
					filetypes = { "terraform", "tf", "hcl" },
				}),
        null_ls.builtins.diagnostics.terraform_validate,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
