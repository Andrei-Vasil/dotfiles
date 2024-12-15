return {
  {
    "tpope/vim-dadbod",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      local db_ilz_test_cloudroom_connection_url = os.getenv("DB_ILZ_TEST_CLOUDROOM_CONNECTION_URL")
      vim.g.dbs = {
          { name = "ilz_test_cloudroom", url = db_ilz_test_cloudroom_connection_url},
      }
    end
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = {
      "sql",
      "mysql",
      "plsql"
    },
  },
}
