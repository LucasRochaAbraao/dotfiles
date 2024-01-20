source "$DOTFILES/base.sh"
# nvim config -> needs fixing, there is something wrong with .vimrc.plug

nvim_config_dir="$HOME/.config/nvim"

install_package neovim

echo_info "Setting up neovim config files."
mkdir -p $nvim_config_dir
ln -sf "$DOTFILES/neovim/.vimrc" "${nvim_config_dir}/init.vim"
ln -sf "$DOTFILES/neovim/.vimrc.plug" "$HOME/.vimrc.plug"

echo_warn "run 'nvim' and execute: ':PlugInstall'"

echo_good "Done."
