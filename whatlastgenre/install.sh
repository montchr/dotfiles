#!/usr/bin/env bash
set -euo pipefail

pip3 install mutagen
pip3 install requests
pip3 install rauth

WLG_CONFIG_DIR="$HOME/.whatlastgenre"
if [ ! -d  $WLG_CONFIG_DIR ] && [ ! -L $WLG_CONFIG_DIR ]; then
	ln -s $DOTFILES/whatlastgenre $WLG_CONFIG_DIR
fi

cd $DOTFILES/whatlastgenre/whatlastgenre
git pull
python3 setup.py install

cd $DOTFILES
git submodule update --init --recursive
