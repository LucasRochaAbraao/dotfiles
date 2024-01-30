source "$DOTFILES/base.sh"

echo_header "Installing batcat"

install_package bat

echo_info "Overriding 'cat' command with an alias for 'batcat' command, \
a 'cat' clone with syntax highlighting."

set_alias "batcat" "cat"
