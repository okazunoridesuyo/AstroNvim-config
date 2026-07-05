return {
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
}
