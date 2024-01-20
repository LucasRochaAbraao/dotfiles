source "$DOTFILES/base.sh"

git_config="$HOME/.gitconfig"

install_package git

echo_info "Setting up git config files."
ln -sf $DOTFILES/git/.gitconfig $git_config

echo_good "Done."
