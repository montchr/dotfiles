#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
#
# Much of this is taken from @necolas' dotfiles:
# https://github.com/necolas/dotfiles

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" > /tmp/homebrew-install.log
fi

# Install homebrew packages
brew install grc coreutils spark

e_header "Updating Homebrew..."
# Use the latest version of Homebrew
brew update
[[ $? ]] && e_success "Done"

e_header "Updating any existing Homebrew formulae..."
# Upgrade any already-installed formulae
brew upgrade
[[ $? ]] && e_success "Done"

e_header "Checking status of desired Homebrew formulae..."
local list_formulae
local -a missing_formulae
local -a desired_formulae=(
  'coreutils' # GNU core utilities (those that come with OS X are outdated)
  'grc',
  'spark'
  'git'
  'hub'
  'ack'
  'bash'
  'bash-completion'
  'ffmpeg'
  'graphicsmagick'
  'jpeg'
  'node'
  'optipng'
  'phantomjs'
  'tree'
  'wget'
)

for index in ${!desired_formulae[*]}
do
  if ! formula_exists ${desired_formulae[$index]}; then
    # Store the name (and options) of every missing formula
    missing_formulae=("${missing_formulae[@]}" "${desired_formulae[$index]}")
  fi
done

if [[ "$missing_formulae" ]]; then
  # Convert the array of missing formula into a list of space-separate strings
  list_formulae=$( printf "%s " "${missing_formulae[@]}" )

  e_header "Installing missing Homebrew formulae..."
  # Install all missing formulae
  brew install $list_formulae

  [[ $? ]] && e_success "Done"
fi

# use latest rsync rather than out-dated OS X rsync
# install separately from the main formulae list to fix gh-19
# brew install https://raw.github.com/Homebrew/homebrew-dupes/master/rsync.rb

# Remove outdated versions from the Cellar
brew cleanup

exit 0
