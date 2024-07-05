#!/usr/bin/env bash

# https://code.visualstudio.com/docs/setup/linux

echo_header "Installing vscode"

ensure_deps "wget" "gpg"

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

if command -v apt &> /dev/null; then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'


elif command -v pacman &> /dev/null; then
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/pacman.d/gnupg/packages.microsoft.gpg
    echo -e "[code]\nServer = https://packages.microsoft.com/arch/stable/community" | sudo tee /etc/pacman.d/vscode.repo > /dev/null
    sudo pacman -Sy

elif command -v dnf &> /dev/null; then
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

    echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
fi

rm -f packages.microsoft.gpg

install_package code

echo_good "Done."
