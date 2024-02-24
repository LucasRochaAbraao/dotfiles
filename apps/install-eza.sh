source "$DOTFILES/base.sh"

echo_header "Installing eza"

cargo install -q eza

echo_info "Overriding 'ls' command with an alias for 'eza' command, \
an 'ls' clone with tables and better colors."

set_alias "ls" "eza -lahgo"

echo_good "Done."