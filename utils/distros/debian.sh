# tested on debian 12 bookworm | ubuntu 23.10

install() {
    local package=$1

    echo_info "Installing $package."

    sudo apt update $QUIET

    sudo apt install -y "$package" $QUIET
}
