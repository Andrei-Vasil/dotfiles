---@type vim.lsp.ClientConfig
return require("schema-companion").setup_client(
  require("schema-companion").adapters.yamlls.setup({
    sources = {
      -- your sources for the language server
      require("schema-companion").sources.matchers.kubernetes.setup({ version = "master" }),
      require("schema-companion").sources.lsp.setup(),
      require("schema-companion").sources.schemas.setup({
        {
          name = "Kubernetes master",
          uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json",
        },
      }),
    },
  }),
  {
    filetypes = { "yaml" },
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    settings = {
      yaml = {
        schemaStore = {
          url = "",
          enable = false,
        },
        schemas = require('schemastore').yaml.schemas(),
      },
    },
  }
)
