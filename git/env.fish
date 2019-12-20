# Alias `git` to `hub`
eval (hub alias -s)

# This can be overridden on a per-project basis using direnv
set -x GIT_PRIMARY_BRANCH 'master'

set -x GIT_EDITOR 'vim'
