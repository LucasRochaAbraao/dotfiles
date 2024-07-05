#!/usr/bin/env bash

ensure_deps "curl"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > install.sh

sudo chmod +x install.sh
run_quietly ./install.sh -yq

source "$HOME/.cargo/env"

rm ./install.sh

echo_good "Done."
