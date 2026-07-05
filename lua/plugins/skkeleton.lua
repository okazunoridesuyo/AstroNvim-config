return {
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
}
