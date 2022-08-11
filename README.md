# dotfiles
Repo to store current dotfiles

Current configuration dotfiles supported:

```
vim (.vimrc)
vim plugin - YouCompleteMe (.ycm_extra_conf.py)
neovim (init.vim)
shell (.bashrc)
tmux (.tmux.conf.local)
starship (starship.toml)
```

The .vimrc plugs not compatible with vi.

## vimrc install prerequisites

In order to use current .vimrc file with the use of plugins, a plugin manager is required. I use [junegunn's vim-plug plugin manager](https://github.com/junegunn/vim-plug). If you are lazy and don't want to visit the git page the following command should install the plugin manager:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## vimrc destination

To use the .vimrc file, copy it to your home directory, below is an example:

```
cp /path/to/dotfiles/vim/.vimrc ~
```

To edit the file, go to your home directory (~ or $HOME) and type

```
vim .vimrc
```


## Vim plugin details
The format used for installing plugins is in this format

```
Plug 'github-username/git-repository-name'
```

To see more details on the plugin you can prefix the plugin string with 'https://github.com/' and it should take you to the source of the plugin. For example to find out more about this plugin:

```
Plug 'sainnhe/edge'
```

I can go to:

```
https://github.com/sainnhe/edge
```

For more information about the plugin.

## Vim plugin install process

If you decide to install more plugins as you type in a new plugin into your .vimrc file, the following commands will making installing the plugins easier:

```
:w
:so %
:PlugInstall
```

`:w` saves the file. `:so %` is short for `:source %` which sources the current file. `:PlugInstall` begins the install process.

## Neovim config
Sometimes when vim is not enough, there is neovim. To the config file, please copy with the following command:

```
cp /path/to/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
```

## Neovim Plugin installation process
The preferred method is the same as vim: using [junegunn's vim-plug plugin manager](https://github.com/junegunn/vim-plug). However, the neovim install command is a little bit different:

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

After this (and copying `init.vim` to `~/.config/nvim/`) the `:PlugInstall` command can be used in the `init.vim` file.

## Coc plugin install
To install c++ autocompletion:

```
CocInstall coc-clangd
```

Rust:

```
CocInstall coc-rust-analyzer
```

Python:

```
CocInstall coc-python
```

## YouCompleteMe(ycm)
Copy (or append) `YouCompleteMe/.ycm_extra_conf.py` to home directory, it currently configures ycm to add auto completion and code analysis on C++20 compatible code.

## bashrc
It is recommend to append the contents of the `.bashrc` and `.bash_functions` rather than to copy the files themselves.

### Adding applying bash config files to host
```
cat /path/to/dotfiles/bash/.bashrc >> ~/.bashrc
cat /path/to/dotfiles/bash/.bash_functions >> ~/.bash_functions
```

## Tmux
The `.tmux.conf.local` is a file that tmux uses to generate the config file (.tmux.conf). It is generally recommended that the `.tmux.conf.local` file is edited rather than the .tmux.conf file.

To install:
```
cp /path/to/dotfiles/tmux/.tmux.conf.local ~
```

## Starship
Starship has two dependencies: [nerd font](https://www.nerdfonts.com/font-downloads) and well, [starship](https://starship.rs). When downloading a nerd font, the files are recommended to be stored in
```
~/.local/share/fonts
```
So that when the fonts get updated with the following command
```
fc-cache -fv
```
The command will search `~/.local/share/fonts` and find the fonts you have downloaded, and install them.

Starship can be installed with the following command
```
curl -sS https://starship.rs/install.sh | sh
```
When starship is installed, it will provide additional info so that starship can be initialized, here is an example for bash, which should be added to the end of the `.bashrc` file.
```
eval "$(starship init bash)"
```
The config file can should be copied to the `~/.config` folder, below is an example
```
cp /path/to/dotfiles/starship/starship.toml ~/.config
```
