# Add local npm bin
set -x PATH $PATH (npm bin)

# Include the dotfiles npm bin for some "global" modules
set -x PATH $PATH $DOTFILES/node_modules/.bin

# Yarn bin
set -x PATH $PATH "$HOME/.yarn/bin" "$HOME/.config/yarn/global/node_modules/.bin"
