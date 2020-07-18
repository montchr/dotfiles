#!/bin/bash

if [ ! -d "$HOME/.config/karabiner" ] && [ ! -L "$HOME/.config/karabiner" ]; then
	ln -s "$DOTFILES/karabiner" "$HOME/.config/karabiner"
fi