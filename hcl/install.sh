if [ ! -L "$HOME/.hcl" ]; then
  ln -s $DOTFILES/hcl/config $HOME/.hcl
fi
