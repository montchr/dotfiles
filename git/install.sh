#!/bin/sh

template_dir="$HOME/.git-templates"

if [ ! -d template_dir ] && [ ! -L template_dir ]; then
    ln -s "$DOTFILES/git/git-templates" "$template_dir"
fi
