#!/usr/bin/env bash

# tested on arch linux <kernel> | manjaro-xfce-23.1.3

install() {
    local package=$1

    echo "Installing $package."
    # Optionally synchronize and update the package databases, needs testing
    # paru -Sy --quiet

    run_quietly paru -S --noconfirm --needed "$package"
}
