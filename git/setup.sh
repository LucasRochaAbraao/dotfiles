#!/usr/bin/env bash

git_config="$HOME/.gitconfig"

install_package git

echo_info "Setting up git config files."
cp -np $DOTFILES/git/.gitconfig $git_config

echo_good "Done."
