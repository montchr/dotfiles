#!/bin/sh

# Include utilities
source $HOME/.dotfiles/lib/utils.zsh

run_npm () {

  if test ! $(which node)
  then
    echo "  Installing node for you."
    brew install node > /tmp/node-install.log
  fi

  e_header "Installing Node.js packages..."

  # List of npm packages
  local packages="bower grunt-cli jshint yo coffee-script coffeelint"

  # Install packages globally and quietly
  npm install $packages --global --quiet

}

run_npm
