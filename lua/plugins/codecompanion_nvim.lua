return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  opts = {
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          schema = {
            model = {
              default = "qwen2.5-coder:7b",
              -- default="deepseek-coder:6.7b",
              -- default = "gemma4",
            },
          },
        })
      end,
    },

    strategies = {
      chat = {
        adapter = "ollama",
      },
      inline = {
        adapter = "ollama",
      },
    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  sources = {
    per_filetype = {
      codecompanion = { "codecompanion" },
    },
  },
}
