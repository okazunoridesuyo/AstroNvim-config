return {
  {
    "chipsenkbeil/org-roam.nvim",
    enabled = false,
    tag = "0.2.0",
    dependencies = {
      {
        "nvim-orgmode/orgmode",
        tag = "0.7.0",
      },
    },
    config = function()
      require("org-roam").setup {
        directory = "~/Documents/orgfiles/roam",
        -- optional
        org_files = {
          "~/Documents/orgfiles",
        },

        bindings = {
          prefix = "<Leader>r",
        },
      }
    end,
  },
}
