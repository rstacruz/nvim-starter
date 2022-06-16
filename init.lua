-- Install Packer if needed
local bootstrap
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd([[echo "Packer was not found, installing..."]])
  local packer_url = "https://github.com/wbthomason/packer.nvim"
  bootstrap = vim.fn.system({ "git", "clone", "--depth", "1", packer_url, install_path })
end

-- Initialise packer
require("packer").startup(function(use)
  use("wbthomason/packer.nvim") -- Package manager

  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Treesitter
  use("neovim/nvim-lspconfig") -- Configure LSP
  use("williamboman/nvim-lsp-installer") -- Install LSP servers (:LspInstall)
  use("jose-elias-alvarez/null-ls.nvim") -- Formatting and diagnostics
  use({ "nvim-telescope/telescope.nvim" }) -- Pick files and more
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("folke/which-key.nvim") -- Menu when pressing [space]
  use("lewis6991/impatient.nvim") -- Improve startup time by optimising Lua cache
  use("projekt0n/github-nvim-theme") -- Theme

  -- Completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/nvim-cmp")
end)

-- Auto-install if needed
if bootstrap then
  require("packer").sync()
else
  pcall(require, "impatient")
end

-- Set theme
vim.cmd([[color github_dark]])

-- LSP installer
require("nvim-lsp-installer").setup({
  automatic_installation = true,
})

-- Which key
vim.o.timeoutlen = 200
require("which-key").setup({})

-- Treesitter
-- Add the languages you use here to ensure_installed. This will
-- install the treesitter grammar for those languages, which will
-- greatly improve the syntax highlighting for that language.
--
-- See this page:
-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
require("nvim-treesitter.configs").setup({
  ensure_installed = { "javascript", "lua", "markdown", "yaml", "json", "html", "vim" },
  highlight = { enable = true },
})
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- LSPConfig
-- For every language server you want to use, add them here.
-- They would need to be installed with :LspInstall
local lspconfig = require("lspconfig")
if vim.fn.executable("ruby") == 1 then
  lspconfig.solargraph.setup({})
end
if vim.fn.executable("node") == 1 then
  lspconfig.tsserver.setup({})
  lspconfig.yamlls.setup({})
end
lspconfig.sumneko_lua.setup({})

-- Key bindings
vim.g.mapleader = " "
require("which-key").register({
  ["<leader>p"] = { name = "pick..." },
  ["<leader>pf"] = { "<cmd>Telescope fd<cr>", "Open files" },
  ["<leader>c"] = { name = "code..." },
  ["<leader>cd"] = { "<cmd>Telescope diagnostics<cr>", "Show errors" },
})
