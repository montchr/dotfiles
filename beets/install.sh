#!/bin/sh

export DOTFILES=$HOME/.dotfiles

# Beets
pip install beets
pip install discogs-client
pip install beets-bandcamp
# Beets: LastGenre
pip install pylast
# Beets: FetchArt
pip install requests
# Beets: Chromaprint/Acoustid
# Note that there are further steps that must be taken that can't
# be automated as easily; check out the documentation
# http://beets.readthedocs.io/en/v1.4.5/plugins/chroma.html
pip install pyacoustid

if [ ! -d "$HOME/.config/beets" ]; then
  ln -s $DOTFILES/beets $HOME/.config/beets
fi
