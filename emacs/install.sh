#!/bin/bash

emacs_dir="$HOME/.emacs.d"

# Install Prelude to ~/.emacs.d
if [ ! -d $emacs_dir ] && [ ! -L $emacs_dir ]; then
  export PRELUDE_INSTALL_DIR="$DOTFILES/emacs/emacs.d"
  export PRELUDE_URL="git@github.com:montchr/.emacs.d.git"

  curl -L https://github.com/bbatsov/prelude/raw/master/utils/installer.sh | sh
  ln -s "$DOTFILES/emacs/emacs.d" "$emacs_dir"
fi
