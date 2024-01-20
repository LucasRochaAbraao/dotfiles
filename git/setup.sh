source "$DOTFILES/base.sh"

git_config_dir="$HOME/.config/git"
git_config="$git_config_dir/.gitconfig"

install_package git

set_env_var "GIT_CONFIG" $git_config

echo_info "Setting up git config files."
mkdir -p $git_config_dir
ln -sf $DOTFILES/git/.gitconfig $git_config

echo_good "Done."
