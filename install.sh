#!/usr/bin/env bash

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
DOTFILES="$(cd "$(dirname "$0")" && pwd)"


# nvim config -> needs fixing, there is something wrong with .vimrc.plug
#echo "Installing nvim config..."
#NVIM_CONFIGDIR="$HOME/.config/nvim"
#NVIM_CONFIG=$NVIM_CONFIGDIR/init.vim
#mkdir -p $NVIM_CONFIGDIR
#ln -sf $DOTFILES/neovim/.vimrc $NVIM_CONFIG
#ln -sf $DOTFILES/neovim/.vimrc.plug $HOME/.vimrc.plug
#echo "run `nvim` and execute: `:PlugInstall`"

# picom config -> add a condition to check if picom is installed first
#mkdir -p $HOME/.config/picom
#ln -sf $DOTFILES/picom/picom.conf $HOME/.config/picom/picom.conf

# starship prompt config
echo "Installing starship config..."
ln -sf $DOTFILES/starship-prompt/starship.toml $HOME/.config/starship.toml

# .gitconfig
echo "Installing git config..."
ln -sf $DOTFILES/.gitconfig $HOME/.gitconfig

# themes, icons and wallpapers
echo "Installing themes..."
mkdir -p $HOME/.themes
mkdir -p $HOME/.icons
mkdir -p $HOME/Pictures/wallpaper/
cp -r $DOTFILES/xfce4-themes/* $HOME/.themes
cp -r $DOTFILES/xfce4-icons/* $HOME/.icons
cp -r $DOTFILES/wallpaper/* $HOME/Pictures/wallpaper

# xfce4 terminal colorschemes
echo "Installing terminal colorschemes..."
mkdir -p $HOME/.local/share/xfce4/terminal/colorschemes
cp -r $DOTFILES/xfce4terminal-colorschemes/* $HOME/.local/share/xfce4/terminal/colorschemes

# xfce4 terminal margin
echo "Setting xfce terminal margin"
ln -sf $DOTFILES/extra/xfce4-terminal-margin.css $HOME/.config/gtk-3.0/gtk.css

# bin scripts
echo "Adding scripts to $HOME/.local/bin/..."
mkdir -p $HOME/.local/bin
ln -sf $DOTFILES/scripts/huion.sh $HOME/.local/bin/huion.sh
sudo chmod +x $HOME/.local/bin/huion.sh

echo "All done! Enjoy..."
