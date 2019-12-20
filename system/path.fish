set -xp PATH ./bin "$DOTFILES/bin" "$HOME/bin" "$HOME/.wp-cli/bin" "$HOME/.cabal/bin"

# Maid
set -xp PATH "$HOME/.maid/bin"

set -xa PATH /usr/local/bin /usr/local/sbin

# Use GNU coreutils first
set -xp PATH /usr/local/opt/coreutils/libexec/gnubin
