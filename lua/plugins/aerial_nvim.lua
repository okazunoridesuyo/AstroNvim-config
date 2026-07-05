return {
  "stevearc/aerial.nvim",
  config = function()
    require("aerial").setup {
      backends = { "lsp", "markdown", "man", "treesitter" },
      layout = {},
      on_attach = function(bufnr) end,
    }
  end,
}
