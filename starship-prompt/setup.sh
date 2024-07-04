#!/usr/bin/env bash

starship_config_dir="$HOME/.config/starship"
starship_config="$starship_config_dir/starship.toml"

if command -v starship &> /dev/null; then
    echo_info "Starship is already installed."
    return $OK_CODE
fi


echo_info "Installing Starship."

# The -s option allows passing options to the script from the sh
# command line and the -- is then required to separate the sh
# options from the options passed to the script.
run_quietly curl -sS https://starship.rs/install.sh | sh -s -- -y

if [ $? -eq 0 ]; then
    echo_info "Starship installed successfully!"
else
    echo_bad "Error: Starship installation failed. Install it manually by running:"
    echo_warn "curl -sS https://starship.rs/install.sh | sh"
    return $ERROR_CODE
fi

echo_info "Setting up starship config files."

set_env_var "STARSHIP_CONFIG" $starship_config
mkdir -p $starship_config_dir
cp -np $DOTFILES/starship-prompt/starship.toml $starship_config

echo_good "Done."
