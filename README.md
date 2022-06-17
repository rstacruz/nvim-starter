# neovim starter config

Simple configuration to get started with with Neovim.

<table>
<tr></tr>
<tr>
<td>

![image](https://user-images.githubusercontent.com/74385/174232104-c2d9fc2e-b025-41c9-afd9-dc44045348c7.png)

</td>
<td>

![image](https://user-images.githubusercontent.com/74385/174232227-c7d92eb0-32c2-4646-8172-b2d8ca42c1df.png)

</td>
<td>

![image](https://user-images.githubusercontent.com/74385/174232272-197faf52-fb5d-455d-9c14-df84e8ab0166.png)

</td>
</tr>
</table>

## What's included

- Packer for package management ([packer](https://github.com/wbthomason/packer.nvim))
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

Neovim 0.7 is required. Paste [**init.lua**](https://github.com/rstacruz/nvim-starter/blob/main/init.lua) into `~/.config/nvim/init.lua`.

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
XDG_CONFIG_HOME=$(pwd) XDG_DATA_HOME=$(pwd)/data nvim
```

<details>
<summary>Not using bash/zsh?</summary>

```bash
# ...alternatively, for fish shell users:
XDG_CONFIG_HOME=(pwd) XDG_DATA_HOME=(pwd)/data nvim
```

</details>

## Adding languages

Edit init.lua, and enable syntax for them (under `nvim-treesitter.configs`). Optionally, advanced features can be unlocked by enablieng their language server (under `lspconfig`).

## Goals

- Provide a template for new Neovim users to start with
- Keep it in 1 file (init.lua) under 150 lines as much as possible

## Also see

- [Gavinok/Kickstart.nvim: A small, documented, and featureful neovim starter config](https://github.com/Gavinok/Kickstart.nvim)
