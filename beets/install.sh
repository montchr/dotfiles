#!/usr/bin/env zsh

export DOTFILES=$HOME/.dotfiles

PATH="$(pyenv root)/shims:$PATH"

# Install the latest version of Beets from GitHub
BEETS_SRC_DIR=$DOTFILES/beets/beets
if [ -d $BEETS_SRC_DIR ]; then
	cd $BEETS_SRC_DIR
	git pull
else
	git clone https://github.com/beetbox/beets.git $BEETS_SRC_DIR
	cd $BEETS_SRC_DIR
fi
python3 setup.py install
cd $DOTFILES

pip3 install discogs-client
# pip3 install beets-bandcamp
pip3 install pylast
pip3 install requests
pip3 install pyacoustid
pip3 install git+https://github.com/x1ppy/gazelle-origin
pip3 install git+https://github.com/x1ppy/beets-originquery

if [ ! -d "$HOME/.config/beets" ] && [ ! -L "$HOME/.config/beets" ]; then
	ln -s $DOTFILES/beets $HOME/.config/beets
fi

# Don't do this automatically because the values need to be configured properly.
# @todo prompt for the values
# if [ ! -f "$DOTFILES/beets/local-config.yaml" ]; then
#   cp "$DOTFILES/beets/local-config.yaml.example" "$DOTFILES/beets/local-config.yaml"
# fi

