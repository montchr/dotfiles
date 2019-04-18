alias g="git"

# See `scmpuff/env.zsh` for the `gl` alias

alias gap="git add -p"
alias gcob="git checkout -b"
alias gc="git commit"
alias gdt="git difftool"
alias gpl="git pull && git submodule update --init --recursive"
alias gps="git push"
alias gaa="git add --all"
alias gca="git commit --amend"
# amend commit without editing message
alias gcam="git commit --amend -C HEAD"
alias gb="git branch"
alias gm="git merge --no-edit"
alias gcp="git cherry-pick"
alias gsh="git stash"
alias gsha="git stash apply"
alias gshp="git stash pop"
alias gshl="git stash list"

# Copy the current branch name to clipboard
alias gbn="$DOTFILES/bin/git-copy-branch-name"

# Show list of files changed in a commit
# Follow with commit hash
alias gdl="git diff-tree --no-commit-id --name-only -r $1"

# List branches ordered by most recent commit
alias gbr="git branch --sort=-committerdate"

# List all the commits on the current branch ahead of master
alias glb="git cherry -v master"

# Deploy to staging
alias gds="$DOTFILES/bin/git-deploy-to-staging"


