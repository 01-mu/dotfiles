-- Disable netrw (builtin file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.relativenumber = false

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
