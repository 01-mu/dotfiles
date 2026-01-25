if vim.treesitter and vim.treesitter.start then
  pcall(vim.treesitter.start, 0)
end
