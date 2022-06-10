# dotfiles
Repo to store current dotfiles

Current configuration dotfiles supported:

```
    vim (.vimrc)
	vim plugin - YouCompleteMe (.ycm_extra_conf.py)
	shell (.bashrc)
	tmux (.tmux.conf.local)
	
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
    cd /path/to/dotfiles
    cp .vimrc ~
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

    Plug 'sainnhe/edge'

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

## YouCompleteMe(ycm)
Copy (or append) `YouCompleteMe/.ycm_extra_conf.py` to home directory, it currently configures ycm to add auto completion and code analysis on C++20 compatible code.

## bashrc
It is recommend to append the contents of the `.bashrc` and `.bash_functions` rather than to copy the files themselves.

### Adding applying bash config files to host
```
cat /path/to/dotfiles/bash/.bashrc >> ~/.bashrc
cat /path/to/dotfiles/bash/.bash_functions >> ~/.bash_functions
```
