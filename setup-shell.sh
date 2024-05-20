echo "Installing fast syntax highlighting..."
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.config/fsh
source ~/.config/fsh/fast-syntax-highlighting.plugin.zsh

echo "Installing OhMyPosh..."
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin/

echo "Downloading catppuccin themes..."
# terminal theme
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v0.2.0/install.py | python3 -

# shell theme
mkdir ~/.oh-my-posh-themes
wget -O ~/.oh-my-posh-themes/catppuccin_frappe.omp.json -q https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/catppuccin_frappe.omp.json

# zsh theme
wget -O ~/.config/fsh/catppuccin-frappe.ini -q https://raw.githubusercontent.com/catppuccin/zsh-fsh/main/themes/catppuccin-frappe.ini
fast-theme XDG:catppuccin-frappe
