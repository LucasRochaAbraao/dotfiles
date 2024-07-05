#!/usr/bin/env bash

try_lsb_release() {
    local distro_name=$(lsb_release -i | awk '{print $3}')
    if [ -z "$distro_name" ]; then
        return $ERROR_CODE
    fi
    echo "$distro_name - lsb_release"
}

try_hostnamectl() {
    local distro_name=$(hostnamectl status | grep 'Operating' | awk '{print $3}')
    if [ -z "$distro_name" ]; then
        return $ERROR_CODE
    fi
    echo "$distro_name - hostnamectl"
}

try_os_release() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        distro_name=$ID
        if [ -z "$distro_name" ]; then
            return $ERROR_CODE
        fi
        echo "$distro_name - os-release"
    else
        return $ERROR_CODE
    fi
}

detect_distro() {
    DISTRO=$(try_hostnamectl || try_lsb_release || try_os_release)
    if [ -z "$DISTRO" ]; then
        echo_bad "Distribution not found."
        return $ERROR_CODE
    fi
    
    return $OK_CODE
}

load_package_manager() {
    distro_lower=$(echo "$DISTRO" | tr '[:upper:]' '[:lower:]')

    case $distro_lower in
        *debian*|*ubuntu*)
            source $DOTFILES/utils/distros/debian.sh
            ensure_deps "build-essential"
            ;;
        *fedora*|*centos*|*rhel*|*oracle*|*ol*)
            source $DOTFILES/utils/distros/rhel.sh
            ensure_deps "gcc"
            ;;
        *arch*|*manjaro*)
            source $DOTFILES/utils/distros/arch.sh
            ;;
        *)
            echo_bad_die "Unsupported distribution: ${DISTRO}"
            ;;
    esac
}
