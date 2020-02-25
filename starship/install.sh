#!/bin/sh

dest="$HOME/.config/starship.toml"
if [ ! -f "$dest" ] && [ ! -L "$dest" ]; then
    ln -s "$DOTFILES/starship/starship.toml" "$dest"
fi
