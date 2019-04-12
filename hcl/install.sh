if [ ! -d "$HOME/.config/hcl" ]; then
  ln -s $DOTFILES/hcl/config $HOME/.hcl
fi
