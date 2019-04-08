#!/bin/sh

if [ ! -d "$DOTFILES/omnifocus/perspective-icons" ]; then
  git clone https://github.com/deaghean/omnifocus-perspective-icons.git $DOTFILES/omnifocus/perspective-icons
fi
