source "$DOTFILES/base.sh"

echo_header "Installing ripgrep"

cargo install -q ripgrep

echo_info "ripgrep (rg) can used to search for a specific text pattern, with amazing speed."
