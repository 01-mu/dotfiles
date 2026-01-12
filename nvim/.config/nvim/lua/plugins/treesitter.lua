return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  opts = {
    highlight = { enable = true },
    auto_install = true,
  },
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
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
