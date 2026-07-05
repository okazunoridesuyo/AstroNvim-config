return {
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
}
