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

      n = {
        -- Redo
        ["<M-u>"] = { "<C-r>", remap = true, desc = "Redo" },

        -- Move lines up/down
        ["<A-j>"] = { ":m .+1<CR>==", desc = "Move line down" },
        ["<A-k>"] = { ":m .-2<CR>==", desc = "Move line up" },
      },

      v = {
        -- Move lines up/down
        ["<A-j>"] = { ":m '>+1<CR>gv-gv", desc = "Move selection down" },
        ["<A-k>"] = { ":m '<-2<CR>gv-gv", desc = "Move selection up" },
      },

      i = {
        ["っｊ"] = { "<ESC>", remap = true, desc = "ESC" },
        ["ｊｋ"] = { "<ESC>", remap = true, desc = "ESC" },
      },
    },
  },
}
