# https://python-poetry.org/docs/basic-usage/

source "$DOTFILES/base.sh"

ensure_deps "pipx"

pipx install poetry 2>&1

poetry completions bash >> ~/.bash_completion

echo_good "Done."