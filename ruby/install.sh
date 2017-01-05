#!/bin/sh

if test ! $(which rvm)
then
  echo "  Installing rvm for you."
  \curl -sSL https://get.rvm.io | bash -s stable --ruby --auto-dotfiles > /tmp/rvm-install.log
fi

$HOME/.rvm/bin/rvm @global do gem install bundler maid rake timetrap
