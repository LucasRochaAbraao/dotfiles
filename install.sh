#!/usr/bin/env sh

# FYI
# This only install config files, you need the following programs installed:
# - nvim
# - starship prompt
# - picom window compositor
# - xfce4 terminal
#
# Icons and themes are copied over, because links can be broken and mess up the
# desktop environment.
#
# ln -sf   => force symbolic link, removing existing destination files.
# mkdir -p => no  error if existing, make parent directories as needed without affecting file modes.

# gets the script's source file pathname, strips it to just the path portion,
# cds to that path, uses pwd to return the abs path of the script.
# In the end, the context is unwound so it ends up back in the running directory,
# but with an environment variable DOTFILES containing the script's path.
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# nvim config
mkdir -p $HOME/.vim
ln -sf $DOTFILES/neovim/.vimrc $HOME/.vimrc
ln -sf $DOTFILES/neovim/.vimrc.plug $HOME/.vimrc.plug
ln -sf $DOTFILES/neovim/skeleton.py $HOME/.vim/skeleton.py
echo "run `nvim` and execute: `:PlugInstall`"

# picom config
mkdir -p $HOME/.config/picom
ln -sf $DOTFILES/picom/picom.conf $HOME/.config/picom/picom.conf

# starship prompt config
ln -sf $DOTFILES/starship-prompt/starship.toml $HOME/.config/starship.toml

# .gitconfig
ln -sf $DOTFILES/.gitconfig $HOME/.gitconfig

# themes, icons and wallpapers
mkdir -p $HOME/.themes
mkdir -p $HOME/.icons
mkdir -p $HOME/Pictures/wallpaper/
cp -r $DOTFILES/xfce4-themes/* $HOME/.themes
cp -r $DOTFILES/xfce4-icons/* $HOME/.icons
cp -r $DOTFILES/wallpaper/* $HOME/Pictures/wallpaper

# xfce4 terminal colorschemes
mkdir -p $HOME/.local/share/xfce4/terminal/colorschemes
cp -r $DOTFILES/xfce4terminal-colorschemes/* $HOME/.local/share/xfce4/terminal/colorschemes

# bin scripts
mkdir -p $HOME/.local/bin/
ln -sf $DOTFILES/scripts/huion.sh $HOME/.local/bin/huion.sh
sudo chmod +x $HOME/.local/bin/huion.sh

echo "All done! Enjoy..."