-- Install Packer on first run
local pack_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(pack_path)) > 0 then
  vim.cmd([[echo "Installing packer..."]])
  vim.g.firstrun = vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", pack_path })
  vim.defer_fn(function()
    vim.cmd("luafile " .. vim.env.MYVIMRC)
  end, 1)
  return
end

-- Initialise packer
require("packer").startup(function(use)
  use("wbthomason/packer.nvim") -- Package manager
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Treesitter
  use("neovim/nvim-lspconfig") -- Configure LSP
  use("williamboman/mason.nvim") -- Install LSP servers (:Mason)
  use("williamboman/mason-lspconfig.nvim")
  use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" }) -- Pick files and more
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("folke/which-key.nvim") -- Menu when pressing [space]
  use("lewis6991/impatient.nvim") -- Improve startup time by optimising Lua cache
  use("projekt0n/github-nvim-theme") -- Theme
  use("hrsh7th/nvim-cmp") -- Completions
  use("hrsh7th/cmp-nvim-lsp") -- Completions for LSP
end)

-- Auto-install packages on first run
if vim.g.firstrun then
  vim.g.firstrun = null
  vim.cmd("autocmd User PackerCompileDone luafile " .. vim.env.MYVIMRC)
  require("packer").sync()
  return
end

require("impatient") -- Optimise lua cache

-- Vim configuration
vim.g.mapleader = " " -- leader key
vim.o.mouse = "a" -- mouse support
vim.o.number = true -- line numbers
vim.o.swapfile = false -- no swap file
vim.o.termguicolors = true -- full color in terminal
vim.o.timeoutlen = 200
vim.o.undofile = false -- no undo file
vim.o.wrap = false -- no word wrap
vim.cmd([[color github_dark]])

-- LSP installer
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    -- "sumneko_lua", 
  }
})

-- Treesitter
-- Adding languages to `ensure_installed` improves syntax highlighting and more.
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "html",
    "json",
    "lua",
    "vim",
    -- "css",
    -- "go",
    -- "javascript",
    -- "markdown",
    -- "php",
    -- "python",
    -- "ruby",
    -- "rust",
    -- "typescript",
    -- ...for more, see: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
  },
  highlight = { enable = true },
})

-- LSPConfig
-- These enable advanced features (go to definition, hover, error checking, etc)
local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup({}) -- lua
-- lspconfig.cssls.setup({}) -- css
-- lspconfig.pylsp.setup({}) -- python
-- lspconfig.pyright.setup({}) -- python type checking
-- lspconfig.solargraph.setup({}) -- ruby
-- lspconfig.tsserver.setup({}) -- javascript and typescript
-- ...for more, see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Telescope
require("telescope").setup({})
require("telescope").load_extension("fzf")

-- Key bindings
require("which-key").setup({})
require("which-key").register({
  ["<c-p>"] = { "<cmd>Telescope fd<cr>", "Open files" },

  ["<leader>s"] = { name = "Settings..." },
  ["<leader>sc"] = { "<cmd>Telescope colorscheme<cr>", "Change colorscheme" },
  ["<leader>si"] = { "<cmd>e $MYVIMRC<cr>", "Edit init.lua" },
  ["<leader>sr"] = { "<cmd>luafile $MYVIMRC<cr>", "Reload settings" },

  ["<leader>p"] = { name = "Pick..." },
  ["<leader>pf"] = { "<cmd>Telescope fd<cr>", "Open files..." },

  ["<leader>c"] = { name = "Code..." },
  ["<leader>cd"] = { "<cmd>Telescope diagnostics<cr>", "Show errors..." },
  ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions..." },
  ["<leader>cr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol..." },

  ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration (lsp)..." },
  ["gd"] = { "<cmd>Telescope lsp_definitions<cr>", "Definitions (lsp)..." },
  ["gh"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover (lsp)" },
  ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation (lsp)..." },
  ["gr"] = { "<cmd>Telescope lsp_references<cr>", "References (lsp)..." },
})

-- Completion
local cmp = require("cmp")
require("cmp").setup({
  sources = cmp.config.sources({ { name = "nvim_lsp" } }, { { name = "buffer" } }),
})
