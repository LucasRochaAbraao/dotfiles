# My Dotfiles

A repo to keep my dotfiles, aiding deployment and provisioning.

## install

These dotfiles only contain config files, you need the following programs installed:

-   nvim
-   starship prompt
-   picom window compositor
-   xfce4 terminal

To download and install the dotfiles:

```console
git clone git@github.com:LucasRochaAbraao/dotfiles.git
cd dotfiles
./install.sh
```

## Themes

#### XFCE4 Terminal

-   XFCE4 terminal colorschemes in `~/.local/share/xfce4/terminal/colorschemes`.![XFCE4 Terminal Color Schemes](reference/xfce4-term-colors.png)

#### Starship Prompt

-   Starship terminal prompt config in `~/.config/starship.toml`. ![Starship Prompt](reference/starship_prompt.png)

## Apps and scripts

#### Neovim

-   Download vim plugins manager with: `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
-   add the following lines to `~/.config/nvim/init.vim` to share code between vim and nvim:

```console
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```

-   Set an alias for nvim in your `.bashrc`:

```console
alias vim="nvim"
```

-   `.vimrc.plug` lives with `.vimrc` in home dir, it manages the vim plugins.

-   There's also a `.vim/skeleton.py` file to boilerplate new python scripts.

#### Huion tablet

-   A script that allows me to use a Huion tablet with Linux, located in `~/bin/huion.sh`.

## Picom

-   `home/.config/picom/picom.conf` is the conf file for the Picom window compositor.

## TODO

-   add zsh and ohmyzsh
-   add tiling window manager
