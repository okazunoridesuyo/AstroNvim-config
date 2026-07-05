return {
  {
    "AstroNvim/astrocore",
    opts = {
      options = {
        opt = {
          wrap = true,
          showbreak = "↳ ",
          formatoptions = "jcqlnt",
          scrolloff = 8,

          list = true,
          listchars = {
            eol = "↵",
            tab = "»-",
            space = "·",
            trail = "·",
            extends = "￫",
            precedes = "￩",
            nbsp = "␣",
          },

          expandtab = true,
          tabstop = 2,
          shiftwidth = 2,
          softtabstop = 2,

          undofile = true,
          undodir = vim.fn.stdpath "state" .. "/undo//",
          swapfile = true,
          directory = vim.fn.stdpath "state" .. "/swap//",
          backup = true,
          backupdir = vim.fn.stdpath "state" .. "/backup//",
        },
      },

      autocmds = {
        wrap_settings = {
          {
            event = "FileType",
            pattern = { "markdown", "csv" },
            desc = "Disable wrap for specific filetypes",
            callback = function() vim.opt_local.wrap = false end,
          },
        },
      },
    },
  },
}
