return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({})
    vim.keymap.set("n", "-", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
  end,
}
