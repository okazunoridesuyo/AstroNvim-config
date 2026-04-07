return {
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
      },
    },
  },
}
