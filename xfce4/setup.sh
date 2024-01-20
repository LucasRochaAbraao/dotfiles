source "$DOTFILES/base.sh"

xfce4_themes_dir="$HOME/.themes"
xfce4_icons_dir="$HOME/.icons"
xfce4_terminal_colorschemes="$HOME/.local/share/xfce4/terminal/colorschemes"
gtk3_config_dir="$HOME/.config/gtk-3.0"


echo_info "Copying xfce4 desktop and windows theme files."
mkdir -p $xfce4_themes_dir
cp -rnp $DOTFILES/xfce4/themes/* $xfce4_themes_dir

echo_info "Copying icon theme files."
mkdir -p $xfce4_icons_dir
cp -rnp $DOTFILES/xfce4/icons/* $xfce4_icons_dir

echo_info "Copying xfce4-terminal color scheme files."
mkdir -p $xfce4_terminal_colorschemes
cp -rnp $DOTFILES/xfce4/terminal-colorschemes/* $xfce4_terminal_colorschemes

echo_info "Setting xfce4-terminal margin."
mkdir -p $gtk3_config_dir
cp -rnp $DOTFILES/xfce4/xfce4-terminal-margin.css $gtk3_config_dir/gtk.css

echo_good "Done."
