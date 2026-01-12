if vim.filetype and vim.filetype.add then
  vim.filetype.add({
    extension = {
      mbt = "moonbit",
    },
  })
else
  vim.cmd([[
    augroup moonbit_filetype
      autocmd!
      autocmd BufRead,BufNewFile *.mbt setfiletype moonbit
    augroup END
  ]])
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "moonbit",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 2
    if vim.treesitter and vim.treesitter.start then
      pcall(vim.treesitter.start, 0, "moonbit")
    end
  end,
})
