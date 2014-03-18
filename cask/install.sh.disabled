# Include utilities
source "$HOME/.dotfiles/lib/utils.zsh"

export DOTFILES=$HOME/.dotfiles

user () {
  printf "\r  [ \033[0;33m?\033[0m ] %s " "$1"
}

select_bundle () {
  user "Select a bundle to install:
        [basic]
        [dev]
        [home]
        or [skip]"
  read bundle

  if ! [ "$bundle" == "skip" ]; then
    installed="[$bundle] $installed"
    brew bundle "$DOTFILES/cask/$bundle.Caskfile"
  elif [ "$bundle" == "skip" ]
    then
    return
  else
    e_error "Please select one of the available options [basic|dev|home|skip]"
  fi
}

printf "\n"
seek_confirmation "Would you like to install the recommended Mac app bundles?"
if is_confirmed; then

  while true; do
    select_bundle

    printf "\n"
    seek_confirmation "You've installed these bundles: $installed"
    if ! is_confirmed; then
      e_success "Done."
      break
    fi
  done
else
  e_warning "Skipped Mac apps install."
fi
