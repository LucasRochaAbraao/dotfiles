source "$DOTFILES/base.sh"

echo_header "Installing rustup toolchain and cargo"

ensure_deps "curl"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > install.sh
./install.sh -yq
rm ./install.sh

echo_good "Done."