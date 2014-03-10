#!/bin/sh

if test ! $(which rvm)
then
  echo "  Installing rvm for you."
  \curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.0 > /tmp/rvm-install.log
fi
