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
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("schema-companion").setup({
        enable_telescope = true,
        matchers = {
          -- add your matchers
          require("schema-companion.matchers.kubernetes").setup({ version = "master" }),
        },
      })
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

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
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
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.terraformls.setup({
        capabilities = capabilities,
      })
      lspconfig.tflint.setup({
        capabilities = capabilities,
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })
      lspconfig.ansiblels.setup({
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup(require("schema-companion").setup_client({
        filetypes = { "yaml" },
        capabilities = capabilities,
        settings = {
          yaml = {
            schemaStore = {
              url = "",
              enable = false,
            },
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      }))
      lspconfig.helm_ls.setup({
        filetypes = { "helm", "helmfile" },
        capabilities = capabilities,
        settings = {
          ['helm-ls'] = {
            logLevel = "info",
            valuesFiles = {
              mainValuesFile = "values.yaml",
              lintOverlayValuesFile = "values.lint.yaml",
              additionalValuesFilesGlobPattern = "values*.yaml"
            },
            helmLint = {
              enabled = true,
              ignoredMessages = {},
            },
            yamlls = {
              enabled = true,
              enabledForFilesGlob = "*.{yaml,yml}",
              diagnosticsLimit = 50,
              showDiagnosticsDirectly = false,
              path = "yaml-language-server",
              initTimeoutSeconds = 3,
              config = {
                schemas = {
                  kubernetes = "templates/**",
                },
                completion = true,
                hover = true,
                -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
              }
            }
          }
        }
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
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
