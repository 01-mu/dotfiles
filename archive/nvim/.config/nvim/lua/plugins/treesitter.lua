return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  opts = {
    ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
  },
  config = function(_, opts)
    require("nvim-treesitter").setup({})
    if opts and opts.ensure_installed then
      require("nvim-treesitter").install(opts.ensure_installed)
    end
    local function register_moonbit()
      local parsers = require("nvim-treesitter.parsers")
      if not parsers.moonbit then
        parsers.moonbit = {
          install_info = {
            url = "https://github.com/moonbitlang/tree-sitter-moonbit",
            revision = "d8e16ae8edd42a62f8e45e1a3b621f9c1b2661fc",
            files = { "src/parser.c", "src/scanner.c" },
            branch = "main",
          },
        }
      end
    end

    register_moonbit()
    vim.api.nvim_create_autocmd("User", {
      pattern = "TSUpdate",
      callback = register_moonbit,
    })
  end,
}
