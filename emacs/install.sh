#!/usr/env bash

emacs_dir="$HOME/.emacs.d"

if [ ! -d emacs_dir ] && [ ! -L emacs_dir ]; then
    ln -s "$DOTFILES/emacs/emacs.d" "$emacs_dir"
fi
