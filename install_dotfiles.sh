#!/usr/bin/env bash

# note:
# - You will be asked for sudo password when installing packages.
#

source base.sh
echo ""

# apps installation
echo_header "Setting up Neovim"
. $DOTFILES/neovim/setup.sh
print_horizontal_line

echo_header "Setting up Starship Prompt"
. $DOTFILES/starship-prompt/setup.sh
print_horizontal_line

echo_header "Setting up Git"
. $DOTFILES/git/setup.sh
print_horizontal_line

for script in $DOTFILES/apps/install-*.sh; do
    . $script
    print_horizontal_line
done

# customization
echo_header "Setting up XFCE4 Themes"
. $DOTFILES/xfce4/setup.sh
print_horizontal_line

echo_header "Setting up Wallpaper directory"
. $DOTFILES/wallpaper/setup.sh
print_horizontal_line

echo_header "Setting up Huion Tablet"
. $DOTFILES/extras/setup_huion.sh
print_horizontal_line

echo ""
echo_good "All done. Enjoy!"
