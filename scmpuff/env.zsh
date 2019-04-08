eval "$(scmpuff init -s)"

# This alias would normally be set in an `aliases.zsh` here or in the git
# directory, but this alias needs to be set after scmpuff is loaded to override
# the value defined there.
#
# Based on https://stackoverflow.com/questions/1057564/pretty-git-branch-graphs
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(green)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(bold cyan)%s%C(reset) %C(dim white)- %an%C(reset)%n''' --all"
