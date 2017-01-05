#!/bin/sh

if test ! $(which rvm)
then
  echo "  Installing rvm for you."
  \curl -sSL https://get.rvm.io | bash -s stable --ruby --auto-dotfiles > /tmp/rvm-install.log
fi

rvm @global do gem install bundler rake timetrap doing
