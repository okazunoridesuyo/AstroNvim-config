return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"

    local skkeleton_component = status.component.builder {
      {
        provider = function()
          local mode = vim.fn["skkeleton#mode"]()
          local modes = {
            hira = "あ",
            kata = "ア",
            hankata = "ｱ",
            zenkaku = "Ａ",
            abbrev = "ab",
          }
          return " " .. (modes[mode] or "A") .. " "
        end,
      },

      condition = function() return vim.fn.exists "*skkeleton#mode" == 1 and vim.fn["skkeleton#mode"]() ~= "" end,

      hl = { fg = "cyan", bold = true },
      update = { "User", pattern = "skkeleton-mode-changed" },
    }
    table.insert(opts.statusline, 3, skkeleton_component)
  end,
}
