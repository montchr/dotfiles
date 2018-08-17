# Add local npm bin
export PATH="$(npm bin):$PATH"

# Include the dotfiles npm bin for some "global" modules
export PATH="$DOTFILES/node_modules/.bin:$PATH"

# Yarn bin
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
