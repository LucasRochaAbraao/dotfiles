
ensure_deps "curl" "build-essential"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > install.sh

sudo chmod +x install.sh
./install.sh -yq $QUIET

source "$HOME/.cargo/env"

rm ./install.sh

echo_good "Done."
