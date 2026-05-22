-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },
  --
  -- -- == Examples of Overriding Plugins ==
  --
  -- -- customize dashboard options
  -- {
  --   "folke/snacks.nvim",
  --   opts = {
  --     dashboard = {
  --       preset = {
  --         header = table.concat({
  --           " █████  ███████ ████████ ██████   ██████ ",
  --           "██   ██ ██         ██    ██   ██ ██    ██",
  --           "███████ ███████    ██    ██████  ██    ██",
  --           "██   ██      ██    ██    ██   ██ ██    ██",
  --           "██   ██ ███████    ██    ██   ██  ██████ ",
  --           "",
  --           "███    ██ ██    ██ ██ ███    ███",
  --           "████   ██ ██    ██ ██ ████  ████",
  --           "██ ██  ██ ██    ██ ██ ██ ████ ██",
  --           "██  ██ ██  ██  ██  ██ ██  ██  ██",
  --           "██   ████   ████   ██ ██      ██",
  --         }, "\n"),
  --       },
  --     },
  --   },
  -- },
  --
  -- -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  --
  -- -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --
  --     -- include the default astronvim config that calls the setup call
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts)
  --   end,
  -- },
  --
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    -- Optional: See `:h nvim-surround.configuration` and `:h nvim-surround.setup` for details
    config = function()
      require("nvim-surround").setup {
        -- Put your configuration here
      }
    end,
  },

  {
    "numToStr/Comment.nvim",
    enabled = true,
    keys = {
      {
        "<C-/>",
        function() require("Comment.api").toggle.linewise.current() end,
        desc = "Comment toggle current line",
      },
      {
        "<C-/>",
        "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        mode = "v",
        desc = "Comment toggle selection",
      },
    },
    config = function()
      require("Comment").setup {
        -- ここを有効にすると、`v` (小文字) で選択した時に「範囲内だけ」をコメントにする
        sticky = true,
        mappings = { basic = true, extra = false },
      }
    end,
  },

  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup {
        backends = { "lsp", "markdown", "man", "treesitter" },
        layout = {},
        on_attach = function(bufnr) end,
      }
    end,
  },

  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup {
        -- IM will be set to `default_im_select` in `normal` mode
        -- For Windows/WSL, default: "1033", aka: English US Keyboard
        -- For macOS, default: "com.apple.keylayout.ABC", aka: US
        -- For Linux, default:
        --               "keyboard-us" for Fcitx5
        --               "1" for Fcitx
        --               "xkb:us::eng" for ibus
        -- You can use `im-select` or `fcitx5-remote -n` to get the IM's name
        default_im_select = "keyboard-us",

        -- Can be binary's name, binary's full path, or a table, e.g. 'im-select',
        -- '/usr/local/bin/im-select' for binary without extra arguments,
        -- or { "AIMSwitcher.exe", "--imm" } for binary need extra arguments to work.
        -- For Windows/WSL, default: "im-select.exe"
        -- For macOS, default: "macism"
        -- For Linux, default: "fcitx5-remote" or "fcitx-remote" or "ibus"
        default_command = "fcitx5-remote",

        -- Restore the default input method state when the following events are triggered
        -- "VimEnter" and "FocusGained" were removed for causing problems, add it by your needs
        set_default_events = { "InsertLeave", "CmdlineLeave" },

        -- Restore the previous used input method state when the following events
        -- are triggered, if you don't want to restore previous used im in Insert mode,
        -- e.g. deprecated `disable_auto_restore = 1`, just let it empty
        -- as `set_previous_events = {}`
        set_previous_events = { "InsertEnter" },

        -- Show notification about how to install executable binary when binary missed
        keep_quiet_on_no_binary = false,

        -- Async run `default_command` to switch IM or not
        async_switch_im = true,
      }
    end,
  },

  {
    "brianhuster/live-preview.nvim",
    dependencies = {
      -- You can choose one of the following pickers
      -- "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
      -- "echasnovski/mini.pick",
      "folke/snacks.nvim",
    },
    config = function()
      require("live-preview").setup {
        port = 5500,
        browser = "flatpak run com.google.Chrome",
        dynamic_root = false,
        sync_scroll = true,
        picker = "snacks.picker",
        address = "127.0.0.1",
      }
    end,
  },

  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },

  {
    "vim-denops/denops.vim",
  },

  {
    "yuki-yano/fuzzy-motion.vim",
    lazy = false,
    init = function()
      vim.g.fuzzy_motion_matchers = {
        "kensaku",
        "fzf",
      }
    end,
    keys = {
      { "f<Leader>", "<cmd>FuzzyMotion<CR>", mode = "n", desc = "enable fuzzy motion" },
    },
  },

  {
    "lambdalisue/kensaku.vim",
  },

  {
    "lambdalisue/vim-kensaku-search",
    keys = {
      { "<CR>", "<Plug>(kensaku-search-replace)<CR>", mode = "c", desc = "enable kensaku-search" },
    },
  },

  {
    "rhysd/clever-f.vim",
    lazy = false,
    event = "BufReadPost",
    priority = 100,
    init = function()
      vim.g.clever_f_across_no_line = 1
      vim.g.clever_f_ignore_case = 1
      vim.g.clever_f_smart_case = 1
      vim.g.clever_f_chars_match_any_signs = ";"
      vim.g.clever_f_fix_key_direction = 1
      vim.g.clever_f_use_migemo = 1
    end,
    -- config = function() vim.fn["clever_f#_apply_mappings"]() end,
    keys = {
      {
        ";",
        "<Plug>(clever-f-repeat-forward)",
        mode = { "n", "v" },
        desc = "clever-f-repeat-forward",
      },

      {
        ",",
        "<Plug>(clever-f-repeat-back)",
        mode = { "n", "v" },
        desc = "clever-f-repeat-back",
      },
    },
  },

  {
    "vim-skk/skkeleton",
    dependencies = { "vim-denops/denops.vim", "Shougo/ddc.vim", "Shougo/pum.vim", "Shougo/ddc-ui-pum" },
    lazy = false,
    config = function()
      vim.fn["skkeleton#config"] {
        globalDictionaries = {
          { "~/.config/skk/SKK-JISYO.L", "euc-jp" },
        },
        eggLikeNewline = true,
        keepState = true,
      }

      vim.fn["skkeleton#register_kanatable"]("rom", {
        l = { "l" },
        la = { "ぁ" },
        li = { "ぃ" },
        lu = { "ぅ" },
        le = { "ぇ" },
        lo = { "ぉ" },
        ltu = { "っ" },
        lya = { "ゃ" },
        lyu = { "ゅ" },
        lyo = { "ょ" },
      }, true)

      vim.fn["skkeleton#register_keymap"]("input", "c", "disable")

      vim.api.nvim_create_autocmd("User", {
        pattern = "skkeleton-mode-changed",
        callback = function() require("blink.cmp").hide() end,
      })

      vim.fn["ddc#custom#patch_global"]("ui", "pum")

      vim.fn["ddc#custom#patch_global"]("sources", { "skkeleton" })

      vim.fn["ddc#custom#patch_global"]("sourceOptions", {
        ["_"] = {
          matchers = { "matcher_head" },
          sorters = { "sorter_rank" },
        },

        skkeleton = {
          mark = "skk",
          matchers = {},
          sorters = {},
          converters = {},
          isVolatile = true,
          minAutoCompleteLength = 1,
        },
      })

      vim.fn["pum#set_option"] {
        border = "rounded",
        padding = true,
        highlight_horizontal_separator = "FloatBorder",
        scrollbar_char = "|",
      }

      vim.api.nvim_set_hl(0, "Pmenu", { link = "NormalFloat" })
      vim.api.nvim_set_hl(0, "PmenuSel", { link = "Visual" })
      vim.api.nvim_set_hl(0, "PmenuSbar", { link = "NormalFloat" })

      vim.fn["ddc#enable"]()
    end,

    keys = {
      {
        "<C-j>",
        "<Plug>(skkeleton-toggle)",
        mode = { "i" },
        desc = "skkeleton-toggle",
      },

      {
        "<Down>",
        function()
          if vim.fn["pum#visible"]() then
            vim.fn["pum#map#insert_relative"](1)
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n", true)
          end
        end,
        mode = "i",
      },
      {
        "<C-n>",
        function()
          if vim.fn["pum#visible"]() then
            vim.fn["pum#map#insert_relative"](1)
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n", true)
          end
        end,
        mode = "i",
      },
      {
        "<Up>",
        function()
          if vim.fn["pum#visible"]() then
            vim.fn["pum#map#insert_relative"](-1)
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n", true)
          end
        end,
        mode = "i",
      },
      {
        "<C-p>",
        function()
          if vim.fn["pum#visible"]() then
            vim.fn["pum#map#insert_relative"](-1)
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n", true)
          end
        end,
        mode = "i",
      },
      {
        "<C-y>",
        function()
          if vim.fn["pum#visible"]() then vim.fn["pum#map#confirm"]() end
        end,
        mode = "i",
      },
      {
        "<C-e>",
        function()
          if vim.fn["pum#visible"]() then vim.fn["pum#map#cancel"]() end
        end,
        mode = "i",
      },
    },
  },

  { "delphinus/skkeleton_indicator.nvim", opts = {} },

  {
    "saghen/blink.cmp",
    enabled = true,
    opts = function(_, opts)
      opts.enabled = function()
        local skk_mode = vim.fn["skkeleton#mode"]()
        return skk_mode == ""
      end
      return opts
    end,
  },

  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"

      local skkeleton_component = status.component.builder {
        {
          provider = function()
            local mode = vim.fn["skkeleton#mode"]()
            local modes = {
              hira = "あ",
              kata = "ア",
              hankata = "ｱ",
              zenkaku = "Ａ",
              abbrev = "ab",
            }
            return " " .. (modes[mode] or "A") .. " "
          end,
        },

        condition = function() return vim.fn.exists "*skkeleton#mode" == 1 and vim.fn["skkeleton#mode"]() ~= "" end,

        hl = { fg = "cyan", bold = true },
        update = { "User", pattern = "skkeleton-mode-changed" },
      }
      table.insert(opts.statusline, 3, skkeleton_component)
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },

    config = function()
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
          signature = {
            enabled = false,
          },
          hover = {
            enabled = false,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },

        views = {
          cmdline_popup = {
            position = {
              row = "50%",
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
          },
          popupmenu = {
            relative = "editor",
            position = {
              row = 8,
              col = "50%",
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
          },
        },
      }
    end,
  },

  {
    "nacro90/numb.nvim",
    config = function() require("numb").setup() end,
  },

  {
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup()
      highlighter = {
        auto_enable = true,
        lsp = true,
      }
    end,
  },
}
