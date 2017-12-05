#!/bin/sh

if [ ! -d "$HOME/.gnupg" ]; then
  mkdir $HOME/.gnupg
fi

cp $DOTFILES/gpg/*.conf $HOME/.gnupg/
