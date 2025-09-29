---@type vim.lsp.ClientConfig
return require("schema-companion").setup_client(
  require("schema-companion").adapters.helmls.setup({
    sources = {
      require("schema-companion").sources.matchers.kubernetes.setup({ version = "master" }),
      require("schema-companion").sources.lsp.setup(),
    },
  }),
  {
    filetypes = { "helm", "helmfile" },
    capabilities = require("blink.cmp").get_lsp_capabilities(),
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
          enabledForFilesGlob = "*.{yaml,yml,tpl}",
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
  }
)
