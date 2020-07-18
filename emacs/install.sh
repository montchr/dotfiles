#!/bin/bash

doom_private_dir="$HOME/.doom.d"

# Complete installation of emacs-plus
if [ ! -L "/Applications/Emacs.app" ]; then
	ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications
	brew services start d12frosted/emacs-plus/emacs-plus
fi

# Install doom-emacs to ~/.emacs.d and symlink its private directory.
if [ ! -d "$doom_private_dir" ] && [ ! -L "$doom_private_dir" ]; then
	git clone https://github.com/hlissner/doom-emacs "$HOME/.emacs.d"
	"$HOME/.emacs.d/bin/doom" install
	ln -s "$DOTFILES/emacs/doom.d" "$doom_private_dir"
fi

# Symlink the org-mode directory.
if [ ! -d "$HOME/org" ] && [ ! -L "$HOME/org" ]; then
	ln -s "$HOME/Dropbox/org" "$HOME/org"
fi
