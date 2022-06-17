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
- Git integration (eg, [neogit](https://github.com/TimUntersberger/neogit))
- Snippets (eg, [luasnip](https://github.com/L3MON4D3/LuaSnip))

## Usage

Neovim 0.6 is required. Paste [**init.lua**](https://github.com/rstacruz/nvim-starter/blob/main/init.lua) into `~/.config/nvim/init.lua`.

```sh
mkdir -p ~/.config/nvim
curl -sL https://raw.githubusercontent.com/rstacruz/nvim-starter/main/init.lua -o ~/.config/nvim/init.lua
# ...or paste init.lua into ~/.config/nvim/init.lua
```

Alternatively, if you just want to give it a try without overriding your config:

```bash
# Create a nvim directory
mkdir -p ~/nvim-starter/{nvim,data}
cd ~/nvim-starter
curl -sL https://raw.githubusercontent.com/rstacruz/nvim-starter/main/init.lua -o nvim/init.lua

# start nvim with this nvim directory
XDG_CONFIG_HOME=$(pwd)/nvim XDG_DATA_HOME=$(pwd)/data nvim

# ...alternatively, for fish shell users:
XDG_CONFIG_HOME=(pwd)/nvim XDG_DATA_HOME=(pwd)/data nvim
```

## Goals

- Provide a template for new Neovim users to start with
- Keep it in 1 file (init.lua) under 150 lines as much as possible

## Also see

- [Gavinok/Kickstart.nvim: A small, documented, and featureful neovim starter config](https://github.com/Gavinok/Kickstart.nvim)
