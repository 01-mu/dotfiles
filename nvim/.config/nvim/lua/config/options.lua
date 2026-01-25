-- Line numbers
vim.opt.number = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Enable mouse
vim.opt.mouse = "a"

vim.cmd("syntax on")

vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Let the terminal (WezTerm) background show through.
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NormalFloat guibg=NONE ctermbg=NONE")
vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")
vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")
