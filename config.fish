set -xg TERM "xterm-256color"
set -xg DOTFILES "$HOME/.dotfiles"

source "$DOTFILES/__aliases.fish"
source "$DOTFILES/__env.fish"
source "$DOTFILES/__path.fish"

for completion_dir in $DOTFILES/fish/*/completions
    set fish_complete_path $completion_dir $fish_complete_path
end
for completion_dir in $DOTFILES/*/completions
    set fish_complete_path $completion_dir $fish_complete_path
end

for func_dir in $DOTFILES/fish/*/functions
    set fish_function_path $func_dir $fish_function_path
end
for func_dir in $DOTFILES/*/functions
    set fish_function_path $func_dir $fish_function_path
end

# GPG
eval (gpgconf --launch gpg-agent)

# rbenv
status --is-interactive; and source (rbenv init -|psub)

# starship
starship init fish | source

# direnv
direnv hook fish | source
