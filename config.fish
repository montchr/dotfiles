set -x -g TERM "xterm-256color"

for env_file in */env.fish; source $env_file; end
for path_file in */path.fish; source $path_file; end
for alias_file in */aliases.fish; source $alias_file; end

for completion_dir in fish/*/completions
    set fish_complete_path $completion_dir $fish_complete_path
end
for completion_dir in */completions
    set fish_complete_path $completion_dir $fish_complete_path
end

for func_dir in fish/*/functions
    set fish_function_path $func_dir $fish_function_path
end
for func_dir in */functions
    set fish_function_path $func_dir $fish_function_path
end
