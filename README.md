# dotfiles
Repo to store current dotfiles

Current configuration dotfiles supported:

```
bash shell
├── .bashrc
└── .bash_functions
starship
└── starship.toml
clangd
└──  config.yaml
helix 
├── config.toml
└── languages.toml
```
## bashrc
It is recommend to append the contents of the `.bashrc` and `.bash_functions` rather than to copy the files themselves.

### Adding applying bash config files to host
```
cat /path/to/dotfiles/bash/.bashrc >> ~/.bashrc
cat /path/to/dotfiles/bash/.bash_functions >> ~/.bash_functions
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

## Clangd
If the clangd plugin is installed for a text editor used, the following command is recommened to copy the clangd config file:
```sh
cp -r /path/to/dotfiles/clangd/ ~/.config/clangd
```

## Helix text editor
If the helix text editor is being used, the following command should be used to copy config files to the right config folder:
```sh
cp -r /path/to/dotfiles/helix ~/.config/helix
```

Remember, you should link the run time to the config folder too
```sh
ln -s /path/to/helix/install/runtime ~/.config/helix/runtime
```
