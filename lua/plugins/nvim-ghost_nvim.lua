return {
  "subnut/nvim-ghost.nvim",
  cmd = {
    "GhostTextStart",
    "GhostTextStop",
  },
  init = function()
    vim.g.nvim_ghost_autostart = 0
    vim.g.nvim_ghost_super_quiet = 1
  end,

  config = function() require("nvim-ghost").setup() end,
}
