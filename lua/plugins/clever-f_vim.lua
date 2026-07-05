return {
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
}
