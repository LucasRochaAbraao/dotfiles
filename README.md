# Linux Dotfiles
This repository contains my dotfiles for Linux (tested only on Debian, base.sh will need adjustments to work with other package managers), providing a streamlined setup and configuration process.

## Installation
To set up your environment, run the installation script. Clone the repository and execute the following commands:

```console
wget https://github.com/LucasRochaAbraao/dotfiles/archive/main.zip -O dotfiles.zip
unzip -qq dotfiles.zip
cd dotfiles-main
./install_dotfiles.sh
```

## The script will automatically install and configure the following:

- xfce4-terminal color schemes: ![XFCE4 Terminal Color Schemes](reference/xfce4-term-colors.png)

- xfce4 themes: Desktop and windows themes

- Wallpapers

- Starship prompt: ![Starship Prompt](reference/starship_prompt.png)

- python setup: Optionally installs poetry and pyenv to manage virtual environments and python versions, respectively.
    - ./install_dotfiles.sh -p

- [Neo]vim config

- Makes sure git is intalled

- Cool linux cli apps: eza (ls clone), ripgrep (pattern searching tool), tealdeer (tldr for comands), batcat (cat clone), vscode, cargo

- Huion Tablet: An optional script that sets the active monitor when using a Huion tablet with Linux.
    - ./install_dotfiles.sh -h