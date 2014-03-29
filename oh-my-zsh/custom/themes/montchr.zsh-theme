# Sexy Solarized Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Customized for the Solarized color scheme by Sean O'Neil

if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then TERM=gnome-256color; fi
if tput setaf 1 &> /dev/null; then
  tput sgr0
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    export BASE03=$(tput setaf 234)
    export BASE02=$(tput setaf 235)
    export BASE01=$(tput setaf 240)
    export BASE00=$(tput setaf 241)
    export BASE0=$(tput setaf 244)
    export BASE1=$(tput setaf 245)
    export BASE2=$(tput setaf 254)
    export BASE3=$(tput setaf 230)
    export YELLOW=$(tput setaf 136)
    export ORANGE=$(tput setaf 166)
    export RED=$(tput setaf 160)
    export MAGENTA=$(tput setaf 125)
    export VIOLET=$(tput setaf 61)
    export BLUE=$(tput setaf 33)
    export CYAN=$(tput setaf 37)
    export GREEN=$(tput setaf 64)
  else
    export BASE03=$(tput setaf 8)
    export BASE02=$(tput setaf 0)
    export BASE01=$(tput setaf 10)
    export BASE00=$(tput setaf 11)
    export BASE0=$(tput setaf 12)
    export BASE1=$(tput setaf 14)
    export BASE2=$(tput setaf 7)
    export BASE3=$(tput setaf 15)
    export YELLOW=$(tput setaf 3)
    export ORANGE=$(tput setaf 9)
    export RED=$(tput setaf 1)
    export MAGENTA=$(tput setaf 5)
    export VIOLET=$(tput setaf 13)
    export BLUE=$(tput setaf 4)
    export CYAN=$(tput setaf 6)
    export GREEN=$(tput setaf 2)
  fi
  export BOLD=$(tput bold)
  export RESET=$(tput sgr0)
else
  # Linux console colors. I don't have the energy
  # to figure out the Solarized values
  export MAGENTA="\033[1;31m"
  export ORANGE="\033[1;33m"
  export GREEN="\033[1;32m"
  export PURPLE="\033[1;35m"
  export WHITE="\033[1;37m"
  export BOLD=""
  export RESET="\033[m"
fi

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

PROMPT="$BOLD $CYAN\u \[$BASE0\]at \[$CYAN\]\h \[$BASE0\]in \[$BLUE\]\w\[$BASE0\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$YELLOW\]\$(parse_git_branch)\[$BASE0\]\n\$ \[$RESET\]"
