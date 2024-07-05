#!/usr/bin/env bash

# tested on Fedora Workstation 39 | centos stream 9 | rhel 9.3 | ol 9.3 | rocky linux 9.3

install() {
    local package=$1

    echo_info "Installing $package."

    run_quietly sudo dnf makecache

    run_quietly sudo dnf check-update

    run_quietly sudo dnf install -y "$package"
}
