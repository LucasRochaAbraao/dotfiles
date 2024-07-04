#!/usr/bin/env bash

# note:
# - You will be asked for sudo password when installing packages.
#
# TODO:
# - fonts
# - adapt for an arch installation
# - fun cli apps flag (fortune, cowsay, etc)
# - ssh config?
# - aliases ?
# - def a func that creates a section in bashrc for dotfiles,
#   and adds whatever I need set into that section (avoid clutter)
# - add a title section

source utils/base.sh
echo ""

PYTHON_SETUP=false
HUION_SETUP=false
INSTALL_CONFIG_FILES=true
INSTALL_THEMES=true

while getopts ":Hhpf" opt; do
    case $opt in
        H) # help
            show_usage $OK_CODE
            ;;
        h) # huion tablet installation
            HUION_SETUP=true
            ;;
        f) # force
            # --force | this will not run regular dotfiles scripts, but only
            # the other option specified (e.g. ./install_dotfiles -fp)
            INSTALL_CONFIG_FILES=false
            INSTALL_THEMES=false
            ;;
        p) # python
            PYTHON_SETUP=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            show_usage $ERROR_CODE
            ;;
    esac
done

if [ "$INSTALL_THEMES" = true ]; then
    # customization
    echo_header "Setting up XFCE4 Themes"
    . "$DOTFILES"/xfce4/setup.sh
    print_horizontal_line

    echo_header "Setting up Wallpaper directory"
    . "$DOTFILES"/wallpaper/setup.sh
    print_horizontal_line
fi

if [ "$PYTHON_SETUP" = true ]; then
    echo_header "Setting up Python"
    . "$DOTFILES"/python/setup.sh
    print_horizontal_line
fi

if [ "$INSTALL_CONFIG_FILES" = true ]; then
    # apps installation
    if [ "$HUION_SETUP" = true ]; then
        echo_header "Setting up Huion Tablet"
        . "$DOTFILES"/extras/setup_huion.sh
        print_horizontal_line
    fi

    echo_header "Installing rustup toolchain and cargo"
    . "$DOTFILES"/apps/setup-cargo.sh
    print_horizontal_line

    for script in "$DOTFILES"/apps/install-*.sh; do
        . "$script"
        print_horizontal_line
    done

    echo_header "Setting up Neovim"
    . "$DOTFILES"/neovim/setup.sh
    print_horizontal_line

    echo_header "Setting up Git"
    . "$DOTFILES"/git/setup.sh
    print_horizontal_line

    echo_header "Setting up Starship Prompt"
    . "$DOTFILES"/starship-prompt/setup.sh
    print_horizontal_line
fi

echo ""
echo_good "All done. Enjoy!"
