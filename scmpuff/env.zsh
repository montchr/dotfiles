eval "$(scmpuff init -s)"

# This alias would normally be set in an `aliases.zsh` here or in the git
# directory, but this alias needs to be set after scmpuff is loaded to override
# the value defined there.
#
alias gl="git log --oneline --decorate -20"
