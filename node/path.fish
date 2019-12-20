# Add local npm bin
set -xp PATH (npm bin)
# Include the dotfiles npm bin for some "global" modules
set -xp PATH $DOTFILES/node_modules/.bin
# Yarn bin
set -xp PATH "$HOME/.yarn/bin" "$HOME/.config/yarn/global/node_modules/.bin"
