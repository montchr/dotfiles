#!/bin/bash

doom_private_dir="$HOME/.doom.d"

if [ "$(uname -s)" == "Darwin" ]; then
	# Finish installation of emacs-plus.
	if [ ! -L "/Applications/Emacs.app" ]; then
		ln -s /usr/local/opt/emacs-plus@27/Emacs.app /Applications/Emacs.app
		brew services start d12frosted/emacs-plus/emacs-plus@27
	fi

	# Symlink the org-mode directory.
	if [ -d "$HOME/Dropbox/org" ] && [ ! -d "$HOME/org" ] && [ ! -L "$HOME/org" ]; then
		ln -s "$HOME/Dropbox/org" "$HOME/org"
	fi
fi

# Update or install doom-emacs.
if [ -d "$doom_private_dir" ] && [ -L "$doom_private_dir" ]; then
	doom upgrade
	doom env
	doom sync
else
	git clone https://github.com/hlissner/doom-emacs "$HOME/.emacs.d"
	"$HOME/.emacs.d/bin/doom" install
	rm -rf "$doom_private_dir"
	ln -s "$DOTFILES/emacs/doom.d" "$doom_private_dir"
fi
