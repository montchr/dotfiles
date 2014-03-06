#!/bin/sh

# Include utilities
source $HOME/.dotfiles/lib/utils.zsh

# Install oh-my-zsh if it's not already installed
if ! [ -d $HOME/.oh-my-zsh ]
  then
  e_header "installing oh-my-zsh"
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  [[ $? ]] && e_success "Done"
fi
