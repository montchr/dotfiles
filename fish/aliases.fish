alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias l='exa -Falh'
alias ll='exa -Flagh --git'
alias la='exa -Fal'
alias lld='exa -Flagh --git --group-directories-first'
alias ld='exa -lghF --git --group-directories-first'
alias tree='exa --tree'
alias ls='grc ls'

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias rm=trash
alias cat=bat

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
