#!/bin/sh

# Include utilities
source $HOME/.dotfiles/lib/utils.zsh

e_header "Installing Node.js packages..."

# List of npm packages
local packages="bower gify grunt-cli jshint karma yo"

# Install packages globally and quietly
npm install $packages --global --quiet