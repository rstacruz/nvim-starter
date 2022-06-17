# neovim starter config

Simple configuation to get started with. Includes:

- Packer for package managerment ([packer](https://github.com/wbthomason/packer.nvim))
- Language Server Support ([nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer), [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig))
- Tree sitter grammar support ([nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter))
- Completions ([nvim-cmp](https://github.com/hrsh7th/nvim-cmp))
- File menus ([telescope](https://github.com/nvim-telescope/telescope.nvim))
- Keymap menus ([which-key](https://github.com/folke/which-key.nvim))

It **does not include** some things, but can be integrated as needed.

- Status line plugin (eg, [lualine](https://github.com/nvim-lualine/lualine.nvim))
- File explorer (eg, [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim))
- Git integration (eg, [fugitive](https://github.com/TimUntersberger/neogit))
- Snippets (eg, luasnip, vsnip)

## Usage

```sh
mkdir $HOME/.config/nvim
# paste init.vim into $HOME/.config/nvim/init.lua
```

## Goal

- Provide a template for new Neovim users to start with
- Keep it in 1 file (init.lua) under 150 lines as much as possible
