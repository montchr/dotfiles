# Use `hub` as our git wrapper:
# http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# Aliases overriden by SCM Breeze
# Leave these commented out (or don't, it doesn't make a difference because
# they're overridden)
#
# alias ga='git add --all'
# alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
# alias gco='git checkout'
# alias gc='git commit'
# alias gd='git difftool'
# alias gb='git branch'
# alias gca='git commit -a'
# alias gaa='git all'
# alias gl='git pull --prune' # aliased as `gpl`
# alias gp='git push origin HEAD' # aliased as `gps`
# alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative" # aliased as `gl`

alias gcb='git copy-branch-name'

# Show list of files changed in a commit
# Follow with commit hash
alias gdl="git diff-tree --no-commit-id --name-only -r $1"
