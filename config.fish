set -xg TERM "xterm-256color"
set -xg DOTFILES "$HOME/.dotfiles"

source "$DOTFILES/__abbreviations.fish"
source "$DOTFILES/__aliases.fish"
source "$DOTFILES/__env.fish"
source "$DOTFILES/__path.fish"

# Completions
for completion_dir in $DOTFILES/*/completions
  set -p fish_complete_path $completion_dir
end

# Functions
for func_dir in $DOTFILES/*/functions
  set -p fish_function_path $func_dir
end

# rbenv
status --is-interactive; and source (rbenv init -|psub)

# starship
starship init fish | source

# direnv
direnv hook fish | source

if test -e "$HOME/.localrc"; source "$HOME/.localrc"; end

# emacs-libvterm integration
function vterm_printf;
    if [ -n "$TMUX" ]
        # tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end
