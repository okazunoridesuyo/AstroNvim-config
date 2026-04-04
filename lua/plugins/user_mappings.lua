return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      --      --Comment out
      --      -- Normal mode
      --      n = {
      --        -- Ctrl + / (内部的には <C-_>) でコメント
      --        ["<C-/>"] = { "gcc", remap = true, desc = "Toggle comment line" },
      --      },
      --      -- Visual mode
      --      v = {
      --        -- Ctrl + / で選択範囲をコメント
      --        ["<C-/>"] = { "gc", remap = true, desc = "Toggle comment selection" },
      --      },

      -- Redo
      n = {
        ["<M-u>"] = { "<C-r>", remap = true, desc = "Redo" },
      },
    },
  },
}
