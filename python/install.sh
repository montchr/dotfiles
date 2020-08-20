#!/usr/bin/env bash
set -euo pipefail

# pyenv dependencies on Linux
if [ "$(uname -s)" == "Linux" ]; then
	sudo apt-get update
	sudo apt-get install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
fi

# Install the versions of python listed in $DOTFILES/.python-version
pyenv install
pyenv global $(pyenv version-name)
