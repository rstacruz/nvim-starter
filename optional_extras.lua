-- Extras: These are some ideas for things that can be added to `init.lua`.
--
--   0. Pick one of the recipe blocks below.
--   1. Add the `use(...)` lines up the packer block in `init.lua`.
--   2. Add the other lines to the bottom of `init.lua`.
--
local use = require("packer").use

-- Lualine: status line
use("nvim-lualine/lualine.nvim")
require("lualine").setup({})

-- Comment: use `gc` to comment
use("numToStr/Comment.nvim")
require("Comment").setup({})

-- Git signs: line indicators to show uncommited lines
use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
require("gitsigns").setup({})

-- null-ls: Code formatting
-- For other sources, see: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
use("jose-elias-alvarez/null-ls.nvim")
local null_ls = require("null-ls")
local sources = {}
if vim.fn.executable("ruby") then -- gem install rubocop
  table.insert(sources, null_ls.builtins.diagnostics.rubocop)
end
if vim.fn.executable("stylua") then -- cargo install stylua
  table.insert(sources, null_ls.builtins.formatting.stylua)
end
if vim.fn.executable("prettierd") then -- volta install @fsouza/prettierd
  table.insert(sources, null_ls.builtins.formatting.prettierd)
end
if vim.fn.executable("eslint_d") then -- volta install eslint_d
  table.insert(sources, null_ls.builtins.diagnostics.eslint_d)
end
null_ls.setup({ sources = sources })

-- null-ls: set up auto-formatting
-- Use `:w` so save and format, or `:noa w` to save without formatting.
-- Be sure to change the file extensions below
vim.cmd([[augroup Nullformat]])
vim.cmd([[au!]])
vim.cmd([[au BufWritePre *.lua,*.js,*.ts,*.tsx lua vim.lsp.buf.formatting_seq_sync()]])
vim.cmd([[augroup END]])
