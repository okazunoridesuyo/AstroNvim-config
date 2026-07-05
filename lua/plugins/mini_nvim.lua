return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    -- ここに有効にしたい機能だけを書く
    require("mini.animate").setup {
      cursor = { enable = true, duration = 50, unit = "total" },
      scroll = { enable = false },
    }
  end,
}
