return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {
          "terraform",
          "hcl",
          "prettier",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "gopls",
          "rust_analyzer",
          "terraformls",
          "tflint",
          "pylsp",
          "ansiblels",
          "yamlls",
          "helm_ls",
          "bashls",
          "eslint",
        },
      })
    end,
  },
  {
    "cenk1cenk2/schema-companion.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("schema-companion").setup({})
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "saghen/blink.cmp",
      "cenk1cenk2/schema-companion.nvim",
      "b0o/schemastore.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua", --only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.lsp.config('*', {
        capabilities = capabilities
      })
      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.cmd("nnoremap <leader>gb <C-t>") -- go back
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>id", vim.diagnostic.open_float, {})
    end,
  },
  {
    "qvalentin/helm-ls.nvim",
    ft = "helm",
    opts = {
      conceal_templates = {
        enabled = false,
      },
      indent_hints = {
        -- enable hints for indent and nindent functions
        enabled = true, -- tree-sitter must be setup for this feature
      },
    },
  },
}
