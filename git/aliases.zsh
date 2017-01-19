# Copy the current branch name to clipboard
alias gbn="$DOTFILES/bin/git-copy-branch-name"

# Show list of files changed in a commit
# Follow with commit hash
alias gdl="git diff-tree --no-commit-id --name-only -r $1"

# List branches ordered by most recent commit
alias gbr="git branch --sort=-committerdate"

# List all the commits on the current branch ahead of master
alias glb="git cherry -v master"
