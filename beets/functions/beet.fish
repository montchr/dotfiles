#!/usr/bin/env fish

function beet -d "beets with local config file loaded"
    command beet --config ~/.config/beets/local-config.yaml $argv
end
