#!/bin/sh

export DOTFILES=$HOME/.dotfiles

# Link XKCD Password Generator to ./bin
# http://xkcd.com/936/
# https://github.com/redacted/XKCD-password-generator
ln -fs "$DOTFILES/lib/XKCD-password-generator/xkcd_password.py" "$DOTFILES/bin/xkcdpasswd"
