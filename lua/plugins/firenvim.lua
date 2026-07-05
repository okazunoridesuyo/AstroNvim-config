return {
  "glacambre/firenvim",
  build = ":call firenvim#install(0)",

  cond = not not vim.g.started_by_firenvim,

  config = function()
    vim.g.firenvim_config = {
      localSettings = {
        [".*"] = {
          cmdline = "neovim",
          content = "text",
          priority = 0,
          selector = "textarea",
          takeover = "never",
        },
      },
    }
  end,
}
