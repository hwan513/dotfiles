#!/bin/zsh
source "$ZDOTDIR/zsh-functions"
zsh_add_file "options/zsh-brew"
# TODO: one day move fzf, powerlevel10k, mise and zoxide installation into here
# TODO: cargo and mise boostrap in a separate file

# General
zsh_add_file zsh-plugins
zsh_add_file "options/zsh-prompt"
zsh_add_file "options/zsh-history"
zsh_add_file "options/zsh-options"
zsh_add_file "options/zsh-completions"

zsh_add_file "personal/zsh-aliases"
zsh_add_file "personal/zsh-vim-mode"

# Exports
zsh_add_file "exports/zsh-android"
zsh_add_file "exports/zsh-cargo"
# zsh_add_file "exports/zsh-conda"
zsh_add_file "exports/zsh-fzf"
# zsh_add_file "exports/zsh-gstreamer"
zsh_add_file "exports/zsh-mise"
zsh_add_file "exports/zsh-scripts"
zsh_add_file "exports/zsh-rye"

# Plugins whic might affect launch time
znap source "zsh-users/zsh-autosuggestions"
znap source "zsh-users/zsh-syntax-highlighting"
znap source "zsh-users/zsh-completions"

znap source "zsh-users/zsh-history-substring-search"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

znap source "hlissner/zsh-autopair" && autopair-init
znap source "kutsan/zsh-system-clipboard" && bindkey -M vicmd Y zsh-system-clipboard-vicmd-vi-yank-eol
znap source "MichaelAquilina/zsh-you-should-use"
# znap source "Aloxaf/fzf-tab"
znap eval z 'zoxide init zsh'
