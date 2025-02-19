#!/bin/zsh
source "$ZDOTDIR/zsh-functions"
zsh_add_file "options/zsh-brew"

# General
# zsh_add_file "options/zsh-prompt"
zsh_add_file "options/zsh-history"
zsh_add_file "options/zsh-options"
zsh_add_file "personal/zsh-aliases"
zsh_add_file "options/zsh-completions"
zsh_add_file "personal/zsh-vim-mode"

# Exports
zsh_add_file "exports/zsh-android"
zsh_add_file "exports/zsh-cargo"
zsh_add_file "exports/zsh-fzf"
zsh_add_file "exports/zsh-mise"
zsh_add_file "exports/zsh-orbstack"
zsh_add_file "exports/zsh-scripts"

# Plugin manager
zsh_add_file "zsh-zim"

cacheval z zoxide init zsh

# TODO: one day move fzf, powerlevel10k, mise and zoxide installation into here
# TODO: cargo and mise boostrap in a separate file
