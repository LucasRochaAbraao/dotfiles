
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
        echo_info "'$DISTRO' detected, loading the appropriate package manager."
    else
        echo_warn "Wasn't able to detect the Linux distribution."
        exit $ERROR_CODE
    fi
}

load_package_manager() {
    case $DISTRO in
        debian|ubuntu)
            source $DOTFILES/utils/distros/debian.sh
            ;;
        fedora|centos|rhel|ol)
            source $DOTFILES/utils/distros/fedora.sh
            ;;
        arch|manjaro)
            source $DOTFILES/utils/distros/arch.sh
            ;;
        *)
            echo_info "Unsupported distribution: $DISTRO"
            exit $ERROR_CODE
            ;;
    esac
}
