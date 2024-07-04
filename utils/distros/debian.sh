#!/usr/bin/env bash

# tested on debian 12 bookworm | ubuntu 23.10

install() {
    local package=$1

    echo_info "Installing $package."

    run_quietly sudo apt update

    run_quietly sudo apt install -y "$package"
}
