#!/usr/bin/env bash

PATH="$HOME/.basher/bin:$PATH"

if [[ ! -d "$HOME/.basher" ]] || [[ ! -L "$HOME/.basher" ]]; then
  ln -s "$DOTFILES/bash/basher" "$HOME/.basher"
fi

eval "$(basher init -)"

basher install bashup/dotenv
