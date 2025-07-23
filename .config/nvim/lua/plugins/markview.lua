return {
    "OXY2DEV/markview.nvim",
    dependencies = {
      { "saghen/blink.cmp", }, -- For blink.cmp's completion
      { "echasnovski/mini.icons", opts = {} },
    },
    lazy = false,

   -- For `nvim-treesitter` users.
    priority = 49,

    preview = {
      icon_provider = "mini",
    },

    config = function()
      local presets = require("markview.presets");

      require("markview").setup({
        filetypes = { "markdown", "quarto", "rmd", "yaml" },
        markdown = {
          headings = presets.headings.slanted,
          tables = presets.tables.single,
        },
        markdown_inline = {
          enable = true,
        },
        yaml = {
          enable = true,
          ---@type markview.config.yaml.properties
          properties = {
              enable = true,
              data_types = {
                  ["text"] = {
                      text = " 󰗊 ", hl = "MarkviewIcon4"
                  },
                  ["list"] = {
                      text = " 󰝖 ", hl = "MarkviewIcon5"
                  },
                  ["number"] = {
                      text = "  ", hl = "MarkviewIcon6"
                  },
                  ["checkbox"] = {
                      ---@diagnostic disable
                      text = function (_, item)
                          return item.value == "true" and " 󰄲 " or " 󰄱 "
                      end,
                      ---@diagnostic enable
                      hl = "MarkviewIcon6"
                  },
                  ["date"] = {
                      text = " 󰃭 ", hl = "MarkviewIcon2"
                  },
                  ["date_&_time"] = {
                      text = " 󰥔 ", hl = "MarkviewIcon3"
                  }
              },
              default = {
                  use_types = true,

                  border_top = " │ ",
                  border_middle = " │ ",
                  border_bottom = " ╰╸",

                  border_hl = "MarkviewComment"
              },
              ["^tags$"] = {
                  match_string = "^tags$",
                  use_types = false,

                  text = " 󰓹 ",
                  hl = nil
              },
              ["^aliases$"] = {
                  match_string = "^aliases$",
                  use_types = false,

                  text = " 󱞫 ",
                  hl = nil
              },
              ["^cssclasses$"] = {
                  match_string = "^cssclasses$",
                  use_types = false,

                  text = "  ",
                  hl = nil
              },


              ["^publish$"] = {
                  match_string = "^publish$",
                  use_types = false,

                  text = "  ",
                  hl = nil
              },
              ["^permalink$"] = {
                  match_string = "^permalink$",
                  use_types = false,

                  text = "  ",
                  hl = nil
              },
              ["^description$"] = {
                  match_string = "^description$",
                  use_types = false,

                  text = " 󰋼 ",
                  hl = nil
              },
              ["^image$"] = {
                  match_string = "^image$",
                  use_types = false,

                  text = " 󰋫 ",
                  hl = nil
              },
              ["^cover$"] = {
                  match_string = "^cover$",
                  use_types = false,

                  text = " 󰹉 ",
                  hl = nil
              }
          },
        },
      });
    end,
};
