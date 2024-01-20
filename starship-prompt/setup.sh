source "$DOTFILES/base.sh"

starship_config_dir="$HOME/.config/starship"
starship_config="$starship_config_dir/starship.toml"

if command -v starship &> /dev/null; then
    echo_info "Starship is already installed."
    return $OK_CODE
fi

curl -sS https://starship.rs/install.sh | sh > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo_info "Starship installed successfully!"
else
    echo_bad "Error: Starship installation failed. Install it manually by running:"
    echo_warn "curl -sS https://starship.rs/install.sh | sh"
fi


echo_info "Setting up starship config files."

set_env_var "STARSHIP_CONFIG" $starship_config
mkdir -p $starship_config_dir
ln -sf $DOTFILES/starship-prompt/starship.toml $starship_config

echo_good "Done."
