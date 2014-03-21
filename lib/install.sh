export DOTFILES=$HOME/.dotfiles

# Link XKCD Password Generator to ./bin
# http://xkcd.com/936/
# https://github.com/redacted/XKCD-password-generator
if ! [ -a "$HOME/.dotfiles/bin/xkcdpasswd" ]; then
  ln -s "$DOTFILES/lib/XKCD-password-generator/xkcd_password.py" ~/.dotfiles/bin/xkcdpasswd
fi
