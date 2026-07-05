return {
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
}
