#!/usr/bin/env bash

dotfiles_wallpaper_dir="$HOME/.themes"
system_wallpaper_dir="$HOME/Pictures/wallpaper"

# note:
# cp:
#   -n [--no-clobber] = do not overwrite an existing file
#   -p [--preserve] = preserve the specified attributes (e.g.: mode,ownership,timestamps)
#   running as silent because when run again, it outputs hundreds of warnings about "not
#   replacing 'x/y/z.png'"

mkdir -p $system_wallpaper_dir
run_quietly cp -rnp $DOTFILES/wallpaper/images/* $system_wallpaper_dir

echo_good "Done."
