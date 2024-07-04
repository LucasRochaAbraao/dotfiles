#!/usr/bin/env bash

# https://python-poetry.org/docs/basic-usage/

ensure_deps "pipx"

run_quietly pipx install poetry

poetry completions bash >> ~/.bash_completion

echo_good "Done."
