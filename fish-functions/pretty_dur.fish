function _pretty_handle_digit -S -a val
    if test -z "$first" -o "$val" -ne 0
        if test -z "$first"
            set -a out ":$(string pad -w 2 -c 0 "$val")"
        else
            set -a out "$val"
            set -e first
        end
    end
end

function pretty_dur -d "Returns the given duration (in ms) as a human formatted string." -a time
    if test "$time" -lt 1000 # 1 second
        echo $time"ms"
        return
    end
    if test "$time" -lt 60000 # 1 minute
        set -l scale 1
        if test "$time" -lt 10000 # 10 seconds
            set scale 2
        end
        echo $(math -s $scale $time / 1000)s
        return
    end
    set -l sec $(math -s 0 $time / 1000)
    set -l min $(math -s 0 $sec / 60)
    set -l hour $(math -s 0 $min / 60)
    set -l day $(math -s 0 $hour / 24)

    set sec $(math $sec % 60)
    set min $(math $min % 60)
    set hour $(math $hour % 24)

    set -l first 1
    set -l out ""

    _pretty_handle_digit "$day"
    _pretty_handle_digit "$hour"
    _pretty_handle_digit "$min"
    _pretty_handle_digit "$sec"

    string join '' -- $out

    return
end
