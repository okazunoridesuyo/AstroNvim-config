return {
  "saghen/blink.cmp",
  enabled = true,
  opts = function(_, opts)
    opts.enabled = function()
      local skk_mode = vim.fn["skkeleton#mode"]()
      return skk_mode == ""
    end
    return opts
  end,
}
