# https://github.com/pyenv/pyenv

source "$DOTFILES/base.sh"

ensure_deps "curl"

curl https://pyenv.run | bash > /dev/null 2>&1

pyenv_config=$(cat <<'EOL'
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
EOL
)

echo "$pyenv_config" >> $BASH_RC

echo_good "Done."
