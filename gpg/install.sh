#!/bin/sh

if [ ! -d "$HOME/.gnupg" ]; then
  mkdir "$HOME/.gnupg"
fi


chmod 700 "$HOME/.gnupg"

cp $DOTFILES/gpg/*.conf "$HOME/.gnupg/"
