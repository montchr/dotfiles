set -x -g TERM "xterm-256color"

for env_file in */env.fish; source $env_file; end
for path_file in */path.fish; source $path_file; end
for alias_file in */aliases.fish; source $alias_file; end

for func_dir in */functions
    set fish_function_path $func_dir $fish_function_path
end
