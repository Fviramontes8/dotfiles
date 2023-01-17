# Setting up neovim via lua
## Folder structure
From the home `README.md`, the following is the file structure of the configuration:

```
nvim/
├── after
│   └── plugin
│       ├── colors.lua
│       ├── fugitive.lua
│       ├── harpoon.lua
│       ├── lsp.lua
│       ├── lualine.lua
│       ├── telescope.lua
│       ├── treesitter.lua
│       └── undotree.lua
├── init.lua
└── lua
    └── fenk
        ├── init.lua
        ├── packer.lua
        ├── remap.lua
        └── set.lua
```
The file `init.lua` kickstarts everything by requiring the `lua/fenk` folder. This kickstarts the `lua/fenk/init.lua` file which require both `lua/fenk/remap.lua` and `lua/fenk/set.lua`. The `lua/fenk/packer.lua` file contains plugin info and plugins used.

### remap.lua
This file contains custom key bindings, it sets the leader to the spacerbar `' '`. A few keybinds to highlight are:

- \<C-h>
- \<C-j>
- \<C-k>
- \<C-l>

These allow for using ctrl + h/j/k/l for navigating split windows (via `:sp` or `:vsp`)

There is also `<leader>j` or `' j'` in normal mode which allows the user to 'jump' around files in any directory.

### set.lua
These include various settings like setting up line numbers, setting indentation size to 4 spaces, etc.

### packer.lua
Place all plugins to be downloaded/used in this file. They can be configured in the `after/plugin` folder.

### after/plugin folder
Contains files configuring plugins downloaded, `colors.lua` is of importance as it configures the colorscheme.