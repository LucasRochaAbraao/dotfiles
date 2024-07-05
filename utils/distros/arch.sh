#!/usr/bin/env bash

# tested on arch linux <kernel> | manjaro-xfce-23.1.3

install_paru() {
    # Update system and install base-devel
    run_quietly sudo pacman -Syu --needed base-devel

    run_quietly git clone https://aur.archlinux.org/paru.git
    cd paru
    run_quietly makepkg -si --noconfirm
    cd ..
    rm -rf paru
}

install() {
    if ! command -v paru &> /dev/null; then
        echo_info "Paru is not installed. Installing..."
        install_paru
    fi

    local package=$1

    echo_info "Installing $package."
    # Optionally synchronize and update the package databases, needs testing
    # paru -Sy --quiet

    run_quietly paru -S --noconfirm --needed "$package"
}
