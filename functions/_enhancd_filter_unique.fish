# _enhancd_filter_unique uniques a stdin contents
function _enhancd_filter_unique
    if [ -n "$argv[1]" ] && [ -f "$argv[1]" ]
        cat "$argv[1]"
    else
        cat <&0
    end | _enhancd_command_awk '!a[$0]++' 2>/dev/null
end
