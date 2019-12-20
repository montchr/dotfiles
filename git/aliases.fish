alias g="git"

# commits / index
alias ga='git add'
alias gaa="git add --all"
alias gap="git add -p"
alias gdt="git difftool"
alias gc="git commit"
alias gca="git commit --amend"
# amend commit without editing message
alias gcam="git commit --amend -C HEAD"
alias gd='git diff'
alias grs='git reset'

# branches / refs
alias gco='git checkout'
alias gcob="git checkout -b"
alias gb="git branch"
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
alias gbl="git recent"

# logs
alias gl="git log --oneline --decorate -20"
# List all the commits on the current branch ahead of master
alias glb="git log --oneline --decorate \$GIT_PRIMARY_BRANCH.."
# Based on https://stackoverflow.com/questions/1057564/pretty-git-branch-graphs
alias gla="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(green)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(bold cyan)%s%C(reset) %C(dim white)- %an%C(reset)%n''' --all"

alias gsumo="git submodule update --init --recursive"
