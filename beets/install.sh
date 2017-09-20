#!/bin/sh

export DOTFILES=$HOME/.dotfiles

if [ ! -d "$DOTFILES/beets" ]; then
  ln -s $DOTFILES/beets $HOME/.config/beets
fi
