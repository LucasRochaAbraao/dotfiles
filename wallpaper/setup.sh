
dotfiles_wallpaper_dir="$HOME/.themes"
system_wallpaper_dir="$HOME/Pictures/wallpaper"

# note:
# cp:
#   -n [--no-clobber] = do not overwrite an existing file
#   -p [--preserve] = preserve  the  specified  attributes (e.g.: mode,ownership,timestamps)

mkdir -p $system_wallpaper_dir
cp -rnp $DOTFILES/wallpaper/images/* $system_wallpaper_dir

echo_good "Done."
