function __fish_evalcache_clear_commands
    set -q FISH_EVALCACHE_DIR
    or set -l FISH_EVALCACHE_DIR "$XDG_CACHE_HOME/.fish-evalcache"

    test -d "$FISH_EVALCACHE_DIR"
    or return

    for file in "$FISH_EVALCACHE_DIR"/*.fish
        string replace -r --filter '^init-([^-]+)-.*\.fish$' '$1' -- (path basename "$file")
    end
end

complete -c _evalcache_clear -s f -l force -d 'Remove all cached files without prompting'
complete -c _evalcache_clear -f \
    -n 'not contains -- --force (commandline -opc)' \
    -a '(__fish_evalcache_clear_commands)' \
    -d 'Remove cached init for command'
