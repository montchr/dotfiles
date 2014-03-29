# Clean, simple, compatible and meaningful.
# Tested on Linux, Mac, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# Based on the ys theme
# http://ysmood.org/wp/2013/03/my-ys-terminal-theme/
# Mar 2013 ys
#
# Mar 2014 montchr

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$terminfo[bold]$fg[white]%}on%{$reset_color%} git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

# Prompt format: \n # [TIME] USER at MACHINE in ../. on git:BRANCH STATE \n $
PROMPT="
%{$terminfo[bold]$fg[blue]%}# %{$fg[white]%}[%*]%{$reset_color%} \
%{$fg[cyan]%}%n%{$reset_color%} \
%{$terminfo[bold]$fg[white]%}at%{$reset_color%} \
%{$fg[green]%}$(box_name)%{$reset_color%} \
%{$terminfo[bold]$fg[white]%}in%{$reset_color%} \
%{$fg[yellow]%}%2~%{$reset_color%} \
${git_info}
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

if [[ "$(whoami)" == "root" ]]; then
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$bg[yellow]%}%{$fg[cyan]%}%n%{$reset_color%} \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
${git_info} \
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"
fi
