source "$DOTFILES/base.sh"
# nvim config -> needs fixing, there is something wrong with .vimrc.plug

nvim_config_dir="$HOME/.config/nvim"
nvim_rc_init="${nvim_config_dir}/init.vim"
nvim_rc_plug="${nvim_config_dir}/.vimrc.plug"

install_package neovim

echo_info "Setting up neovim config."
mkdir -p $nvim_config_dir
cp -np "$DOTFILES/neovim/.vimrc" $nvim_rc_init
cp -np "$DOTFILES/neovim/.vimrc.plug" $nvim_rc_plug

check_deps "curl"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' > /dev/null 2>&1

# this multiline config will be appended to the end of nvimrc's init file,
# with the correct user config path.
vimrc_plug_config=$(cat <<EOL
" Call the vimrc.plug file
if filereadable(expand("$nvim_rc_plug"))
    source $nvim_rc_plug
endif
EOL
)

echo "$vimrc_plug_config" >> $nvim_rc_init
echo_warn "Open 'vim' and run: ':PlugInstall'"

echo_good "Done."
