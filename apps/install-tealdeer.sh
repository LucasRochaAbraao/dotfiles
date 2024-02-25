
echo_header "Installing tealdeer"

cargo install -q tealdeer

echo_info "Downloading bash completion for tldr."

sudo curl -o /usr/share/bash-completion/completions/tldr \
    https://raw.githubusercontent.com/dbrgn/tealdeer/main/completion/bash_tealdeer \
    $QUIET

tldr --update $QUIET

echo_good "Done."