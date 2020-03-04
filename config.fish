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

# GPG
eval (gpgconf --launch gpg-agent)

# rbenv
status --is-interactive; and source (rbenv init -|psub)

# starship
starship init fish | source

# direnv
direnv hook fish | source

if test -e "$HOME/.localrc"; source "$HOME/.localrc"; end
