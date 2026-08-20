function _evalcache_clear
    set -q FISH_EVALCACHE_DIR; or set -gx FISH_EVALCACHE_DIR "$XDG_CACHE_HOME/.fish-evalcache"

    set -l flags -i
    if contains -- --force $argv
        set flags -f
        set -e argv[(contains -i -- --force $argv)]
    end

    if test (count $argv) -eq 0
        rm $flags "$FISH_EVALCACHE_DIR"/init-*.fish
    else
        set -l cmd (basename $argv[1])
        rm $flags "$FISH_EVALCACHE_DIR/init-$cmd"-*.fish
    end
end
