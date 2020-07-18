#!/bin/bash

if [ ! -f "$HOME/.config/karabiner/karabiner.json" ] && [ ! -L "$HOME/.config/karabiner/karabiner.json" ]; then
	ln -s "$DOTFILES/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"
fi