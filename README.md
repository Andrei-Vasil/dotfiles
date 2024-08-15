# Recommended utils

## oh-my-zsh
Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/wiki):
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Stow
Manage symlinks with [stow](https://www.gnu.org/software/stow/) \
To install, just use your package manager e.g. `sudo apt install stow` \
Further reading on [.stow-local-ignore](https://www.gnu.org/software/stow/manual/html_node/Types-And-Syntax-Of-Ignore-Lists.html) \
Run with `stow .` \
If you have conflicting files, adopt them in this directory with `stow --adopt .`

## powerlevel10k
Add p10k to oh my zsh themes: 
```sh
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

### Additional plugins
Add zsh-syntax-highlighting:
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Tmux
TBD