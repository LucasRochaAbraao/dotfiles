#!/usr/bin/env bash

echo_header "Installing pyenv"
. $DOTFILES/python/pyenv.sh
print_horizontal_line

echo_header "Installing poetry"
. $DOTFILES/python/poetry.sh
