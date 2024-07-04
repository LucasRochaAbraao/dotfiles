#!/usr/bin/env bash

echo_header "Installing tealdeer"

cargo install -q tealdeer

echo_info "Downloading bash completion for tldr."

run_quietly sudo curl -o /usr/share/bash-completion/completions/tldr \
    https://raw.githubusercontent.com/dbrgn/tealdeer/main/completion/bash_tealdeer \

run_quietly tldr --update

echo_good "Done."