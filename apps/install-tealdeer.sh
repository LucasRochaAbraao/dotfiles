source "$DOTFILES/base.sh"

echo_header "Installing tealdeer"

cargo install -q tealdeer

echo_info "Downloading bash completion for tldr."

curl -o /usr/share/bash-completion/completions/tldr \
    https://raw.githubusercontent.com/dbrgn/tealdeer/main/completion/bash_tealdeer

tldr --update > /dev/null 2>&1
