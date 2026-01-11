-- jj to escape (insert mode)
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

vim.keymap.set("n", "<C-h>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>bnext<CR>")
