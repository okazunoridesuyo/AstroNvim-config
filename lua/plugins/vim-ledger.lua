return {
  {
    "ledger/vim-ledger",
    keys = {
      -- { "<Leader>Lb", "!hledger balance -p thismonth", mode = "c", desc = "hledger balance" },
      -- { "<Leader>Lr", "!hledger register -p thismonth", mode = "c", desc = "hledger register" },
    },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      filetypes = {
        extension = {
          hledger = "ledger",
        },
      },
    },
  },
}
