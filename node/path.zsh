# Add local npm bin
export PATH="$(npm bin):$PATH"

# Include the dotfiles npm bin for some "global" modules
export PATH="$DOTFILES/node_modules/.bin"
