#!/bin/zsh
source "$ZDOTDIR/zsh-functions"
_zsh_add_file "options/zsh-brew"

# General
_zsh_add_file "options/zsh-prompt"
_zsh_add_file "options/zsh-history"
_zsh_add_file "options/zsh-options"
_zsh_add_file "personal/zsh-aliases"
_zsh_add_file "options/zsh-completions"
_zsh_add_file "personal/zsh-vim-mode"

# Exports
_zsh_add_file "exports/zsh-android"
_zsh_add_file "exports/zsh-cargo"
_zsh_add_file "exports/zsh-fzf"
_zsh_add_file "exports/zsh-mise"
_zsh_add_file "exports/zsh-orbstack"
_zsh_add_file "exports/zsh-scripts"

# Plugin manager
_zsh_add_file "zsh-zim"

_cacheval z zoxide init zsh

# TODO: one day move fzf, powerlevel10k, mise and zoxide installation into here
# TODO: cargo and mise boostrap in a separate file
