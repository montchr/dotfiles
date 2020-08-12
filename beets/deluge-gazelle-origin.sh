#!/usr/bin/env fish

set id $argv[1]
set name $argv[2]
set path $argv[3]

if grep flacsfor.me "$path"/"$id".torrent
    gazelle-origin -o "$path"/origin.yaml "$id"
end
