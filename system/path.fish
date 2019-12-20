set -x PATH ./bin "$DOTFILES/bin" "$HOME/bin" "$HOME/.wp-cli/bin" "$HOME/.cabal/bin" $PATH

# Maid
set -x PATH "$HOME/.maid/bin" $PATH

set -x PATH $PATH /usr/local/bin /usr/local/sbin

# Use GNU coreutils first
set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
