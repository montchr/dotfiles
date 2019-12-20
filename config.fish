set -xg TERM "xterm-256color"
set -xg DOTFILES "$HOME/.dotfiles"

for env_file in $DOTFILES/*/env.fish; source $env_file; end
for path_file in $DOTFILES/*/path.fish; source $path_file; end
for alias_file in $DOTFILES/*/aliases.fish; source $alias_file; end

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
