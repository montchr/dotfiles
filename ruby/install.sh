#!/bin/sh

rbenv init

# Install latest stable Ruby
# https://gist.github.com/rgb-one/6cc6b0a2e609232e8038
LATEST_RUBY_VERSION=$(rbenv install -l | grep -v - | tail -1)
rbenv install -v $LATEST_RUBY_VERSION
rbenv rehash
rbenv global $LATEST_RUBY_VERSION

gem install sqlite3
gem install bundler
bundle install
