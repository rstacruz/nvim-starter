-- Install Packer on first run
local strapped
local pack_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(pack_path)) > 0 then
  vim.cmd([[echo "Installing packer..."]])
  strapped = vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", pack_path })
end

-- Initialise packer
require("packer").startup(function(use)
  use("wbthomason/packer.nvim") -- Package manager
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Treesitter
  use("neovim/nvim-lspconfig") -- Configure LSP
  use("williamboman/nvim-lsp-installer") -- Install LSP servers (:LspInstall)
  use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" }) -- Pick files and more
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use("folke/which-key.nvim") -- Menu when pressing [space]
  use("lewis6991/impatient.nvim") -- Improve startup time by optimising Lua cache
  use("projekt0n/github-nvim-theme") -- Theme
  use("hrsh7th/nvim-cmp") -- Completions
  use("hrsh7th/cmp-nvim-lsp") -- Completions for LSP
end)

-- Auto-install if needed
if strapped then
  vim.cmd("autocmd User PackerCompileDone luafile " .. vim.env.MYVIMRC)
  require("packer").sync()
  return
end

-- Optimise lua cache
require("impatient")

-- Vim configuration
vim.o.number = true -- line numbers
vim.o.mouse = "a" -- mouse support
vim.o.undofile = false -- no undo file
vim.o.swapfile = false -- no swap file
vim.o.wrap = false -- no word wrap
vim.g.mapleader = " " -- leader key
vim.cmd([[color github_dark]])

-- LSP installer
require("nvim-lsp-installer").setup({}) -- automatic_installation = true })

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
  ensure_installed = { "javascript", "ruby", "lua", "markdown", "yaml", "json", "html", "vim" },
  highlight = { enable = true },
})

-- LSPConfig
-- For every language server you want to use, add them here.
-- They would need to be installed with :LspInstall
local lspconfig = require("lspconfig")
if vim.fn.executable("ruby") then
  lspconfig.solargraph.setup({})
end
if vim.fn.executable("node") then
  lspconfig.tsserver.setup({})
  lspconfig.yamlls.setup({})
end
if vim.fn.executable("python3") then
  lspconfig.pylsp.setup({})
  lspconfig.pyright.setup({})
end
lspconfig.sumneko_lua.setup({})

-- Telescope
require("telescope").setup({})
require("telescope").load_extension("fzf")

-- Key bindings
-- Managed by which-key
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
})

-- Completion
local cmp = require("cmp")
require("cmp").setup({
  sources = cmp.config.sources({ { name = "nvim_lsp" } }, { { name = "buffer" } }),
})
