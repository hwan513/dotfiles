function _evalcache_clear
    set -q FISH_EVALCACHE_DIR; or set -gx FISH_EVALCACHE_DIR "$XDG_CACHE_HOME/.fish-evalcache"

    if test (count $argv) -eq 0
        rm -i "$FISH_EVALCACHE_DIR"/init-*.fish
    else
        set -f cmd (basename $argv[1])
        rm -i "$FISH_EVALCACHE_DIR/init-$cmd"-*.fish
    end
end
