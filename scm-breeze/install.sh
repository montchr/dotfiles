#!/bin/sh
# Install SCM Breeze

export scmbDir="$HOME/.scm_breeze"

# Include utilities
source "$HOME/.dotfiles/lib/utils.zsh"
# SCM Breeze functions
source "$scmbDir/lib/scm_breeze.sh"

if ! [ -d "$HOME/.scm_breeze" ]
  then
  e_header "Installing SCM Breeze"
  git clone git://github.com/ndbroadbent/scm_breeze.git "$HOME/.scm_breeze"
else
  e_header "Updating SCM Breeze"
  update_scm_breeze
fi

"$HOME/.scm_breeze/install.sh"
