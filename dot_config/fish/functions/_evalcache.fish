# Copied and modified from https://github.com/kyohsuke/fish-evalcache
function _evalcache
    if test (count $argv) -eq 0
        return
    end

    set -q FISH_EVALCACHE_DIR; or set -gx FISH_EVALCACHE_DIR "$XDG_CACHE_HOME/.fish-evalcache"

    set -f cmdArgs (string join -- '_' $argv | string replace -a -r '[^a-zA-Z0-9._-]' '_')
    set -f cmd (basename $argv[1])
    set -f cacheFile "$FISH_EVALCACHE_DIR/init-$cmd-$cmdArgs.fish"

    if test "$FISH_EVALCACHE_DISABLE" = true
        eval ($argv | source)
    else if test -s "$cacheFile"
        source "$cacheFile"
    else
        if type "$argv[1]" >/dev/null
            echo "$argv[1] initialization not cached, caching output of: $argv" 1>&2
            mkdir -p "$FISH_EVALCACHE_DIR"

            $argv >"$cacheFile"
            source "$cacheFile"
        else
            echo "evalcache ERROR: $cmd is not installed or in PATH"
        end
    end
end
