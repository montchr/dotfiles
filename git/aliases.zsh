#!/bin/sh

alias g="git"

# See `scmpuff/env.zsh` for the `gl` alias

alias gsumo="git submodule update --init --recursive"

# commits / index
alias gaa="git add --all"
alias gap="git add -p"
alias gdt="git difftool"
alias gc="git commit"
alias gca="git commit --amend"
# amend commit without editing message
alias gcam="git commit --amend -C HEAD"

# branches / refs
alias gcob="git checkout -b"
alias gb="git branch"
# Output the current branch name
# alias gbn='echo $(git rev-parse --abbrev-ref HEAD)'
alias gm="git merge --no-edit"
alias gmt="git mergetool"
alias gcp="git cherry-pick"

# remotes
alias gpl="git pull"
alias gplo='git pull origin'
alias gpls="git pull && gsumo"
alias gps="git push"
alias gpsu="git push -u"
alias gpso="git push origin"
alias gpss="git push && gsumo"

# stashes
alias gsh="git stash"
alias gsha="git stash apply"
alias gshp="git stash pop"
alias gshl="git stash list"

# Show list of files changed in a commit
# Follow with commit hash
alias gdl="git diff-tree --no-commit-id --name-only -r $1"

# List branches ordered by most recent commit
alias gbl="git branch --sort=-committerdate"

# List all the commits on the current branch ahead of master
alias glb="git cherry -v master"


