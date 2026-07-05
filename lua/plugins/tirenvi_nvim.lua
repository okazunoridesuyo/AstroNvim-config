-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "kibi2/tirenvi.nvim",
  dependencies = {
    "tpope/vim-repeat", -- optional: enables '.' repeat for column width operations
  },
  config = function()
    require("tirenvi").setup {
      parser_map = {
        csv = { executable = "tir-csv", required_version = "0.1.4" },
        tsv = { executable = "tir-csv", options = { "--delimiter", "\t" }, required_version = "0.1.4" },
        markdown = { executable = "tir-gfm-lite", allow_plain = true, required_version = "0.1.6" },
        pukiwiki = { executable = "tir-pukiwiki", allow_plain = true, required_version = "0.1.1" },
      },
    }
  end,
}
