source "$DOTFILES/base.sh"

home_bin_dir="$HOME/.local/bin"

echo_header "Setting up huion tablet script"

install_package xinput

echo_info "Copying huion.sh to $home_bin_dir. In the future, run it with: 'huion_setup'"
mkdir -p $home_bin_dir
cp -np $DOTFILES/extras/huion.sh "$home_bin_dir/huion_setup"

echo_info "Running 'huion_setup'."
$home_bin_dir/huion_setup

echo_good "Done."
