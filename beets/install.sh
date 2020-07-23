#!/bin/sh

export DOTFILES=$HOME/.dotfiles

exit 0

# Install the latest version of Beets from GitHub
BEETS_SRC_DIR=$DOTFILES/beets/beets
# pip uninstall beets
if [ -d $BEETS_SRC_DIR ]; then
  cd $BEETS_SRC_DIR
  git pull
else
  git clone https://github.com/beetbox/beets.git $BEETS_SRC_DIR
  cd $BEETS_SRC_DIR
fi
pip install -e .
cd $DOTFILES

pip install discogs-client
pip install beets-bandcamp
# Beets: LastGenre
pip install pylast
# Beets: FetchArt
pip install requests
# Beets: Chromaprint/Acoustid
pip install pyacoustid

if [ ! -d "$HOME/.config/beets" ] && [ ! -L "$HOME/.config/beets" ]; then
  ln -s $DOTFILES/beets $HOME/.config/beets
fi
