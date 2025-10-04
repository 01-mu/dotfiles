return {
  -- Tokyo Night
  {
    "folke/tokyonight.nvim",
    opts = function(_, opts)
      opts.transparent = true
      opts.styles = { sidebars = "transparent", floats = "transparent" }
    end,
  },
  -- Catppuccin (if you switch to it)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = { transparent_background = true },
  },
}
