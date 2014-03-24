#!/bin/sh

cabal update
cabal install cabal-install

# Install Shellcheck the roundabout way
# For SublimeLinter-Shellcheck
cabal install shellcheck
