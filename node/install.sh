#!/bin/sh

if test ! $(which node)
then
  echo "  Installing node for you."
  brew install node > /tmp/node-install.log
fi

e_header "Installing Node.js packages..."

# List of npm packages
local packages="bower gify grunt-cli jshint karma yo"

# Install packages globally and quietly
npm install $packages --global --quiet