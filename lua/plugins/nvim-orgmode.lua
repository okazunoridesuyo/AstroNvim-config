return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>Ox"] = {
            desc = "org toggle checkbox",
          },
        },
      },
    },
  },

  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    dependencies = {
      "MeanderingProgrammer/render-markdown.nvim",
      "nvim-treesitter/nvim-treesitter",
    },

    config = function()
      require("orgmode").setup {
        org_agenda_files = { "~/Documents/orgfiles/org/**/*" },
        org_default_notes_file = "~/Documents/orgfiles/refile.org",

        mappings = {
          prefix = "<Leader>O",
          org = {
            org_toggle_checkbox = { "<C-Space>", "<Leader>Ox" },
          },
        },

        -- org_hide_leading_stars = true,
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "org",
        callback = function()
          vim.schedule(function()
            vim.opt_local.foldmethod = "expr"
            vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end)
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",

    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      vim.list_extend(opts.ensure_installed, {
        "org",
      })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",

    event = "VeryLazy",
    -- ft = {
    --   "markdown",
    --   "org",
    -- },

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.nvim",
    },

    init = function()
      vim.opt.conceallevel = 2
      vim.opt.concealcursor = "nc"
    end,

    config = function()
      require("render-markdown").setup {
        log_level = "debug",
        file_types = { "markdown", "org" },
      }
    end,
  },
}
