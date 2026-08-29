# Recommended utils

## oh-my-zsh
Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/wiki):
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### powerlevel10k
Add p10k to oh my zsh themes: 
```sh
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

### Additional plugins
Add zsh-syntax-highlighting:
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```


## Stow
Install [stow](https://www.gnu.org/software/stow/):
```sh
sudo pacman -S stow  # use your preferred package manager
```
Run:
```sh
stow .
stow --adopt .  # if you have conflicting files, adopt them in this directory
```
Further reading on [.stow-local-ignore](https://www.gnu.org/software/stow/manual/html_node/Types-And-Syntax-Of-Ignore-Lists.html)


## Tmux
Install [tmux](https://github.com/tmux/tmux/wiki):
```sh
sudo pacman -S tmux  # use your preferred package manager
```

### TPM
Install Tmux Plugin manager TPM:
```sh
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Install the plugins by pressing `<prefix> + I` inside tmux

## NVim
ripgrep is required for Telescope Live Grep functionality
```sh
# LSPs and tree-sitter parser:
sudo pacman -S tree-sitter tree-sitter-cli nodejs npm go
# Telescope:
sudo pacman -S ripgrep
# Clipboard:
sudo pacman -S wl-clipboard
```

## Hyprland

Install hyprland, kitty and uwsm (Universal Wayland Session Manager - useful for systemd integration)
```sh
sudo pacman -S hypr kitty uwsm
```

Install bluetooth GUI:
```sh
sudo pacman -S blueman
```

For wallpapers:
```sh
sudo pacman -S awww
```
