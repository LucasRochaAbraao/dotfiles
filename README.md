# My Dotfiles
Um repositório para manter os dotfiles, padronizando minha interação em diversos sistemas.

# Installation
## VIM (NVIM)
- Download vim plugins manager with: `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
- add the following lines to `~/.config/nvim/init.vim` to share code between vim and nvim:
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```
- `.vimrc.plug` stays with .vimrc on home dir, it manages the vim plugins.
