# https://python-poetry.org/docs/basic-usage/

ensure_deps "pipx"

pipx install poetry $QUIET

poetry completions bash >> ~/.bash_completion

echo_good "Done."
