# https://github.com/pyenv/pyenv

ensure_deps "curl"

curl https://pyenv.run | bash $QUIET

pyenv_config=$(cat <<'EOL'
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
EOL
)

echo "$pyenv_config" >> $BASH_RC

echo_good "Done."
