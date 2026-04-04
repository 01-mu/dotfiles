return {
  "moonbit-community/moonbit.nvim",
  ft = { "moonbit" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  init = function()
    package.preload["moonbit.treesitter"] = function()
      return { setup = function() end }
    end
  end,
  opts = {
    treesitter = {
      enabled = false,
      auto_install = true,
    },
    lsp = false,
  },
}
