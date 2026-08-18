# regenerate the emitted script when the source binary or a config file passed as an arg changes.
function cached_init --argument-names bin --description "Cache an init command's output, keyed on the binary's and config files' mtimes"
    set -l binpath (command -v $bin) 2>/dev/null
    or return
    set -l args $argv[2..]
    set -l key (string join '--' $binpath $args | string replace -a -r '[^A-Za-z0-9._-]' '_')
    set -l cache ~/.cache/fish/init-$key.fish
    set -l stale false
    if not test -f "$cache"; or test "$binpath" -nt "$cache"
        set stale true
    end
    for arg in $args
        if test -f "$arg"; and test "$arg" -nt "$cache"
            set stale true
            break
        end
    end
    if test "$stale"
        mkdir -p (path dirname "$cache")
        $binpath $args > "$cache"
    end
    source "$cache"
end
