#!/bin/zsh
# cool prompt {{{
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}
# zsh history storing {{{
export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=10000000 # size of cached shell history
export SAVEHIST=10000000 # size of shell history file
setopt APPEND_HISTORY # zsh history is appended to instead of being rewritten
setopt SHARE_HISTORY # zsh history is written immediately to histfile
setopt EXTENDED_HISTORY # zsh history timestamp is also written to histfile
# }}}
# options (run man zshoptions) {{{
setopt auto_cd extended_glob nomatch menu_complete
setopt interactive_comments		# Allow shell comments.
# setopt correct_all dvorak		# Spell	check.
stty stop undef				# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none') 		# No highlight on paste.
# }}}
# completions {{{
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist
setopt globdots # compinit
# }}}
# scrolling keybinds {{{
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# }}}
# Add stuff {{{
source "$ZDOTDIR/zsh-functions"
# # Other files to source {{{
# Normal files to source (Don't have those files yet)
# zsh_add_file "zsh-vim-mode"
# zsh_add_file "zsh-aliases"
# zsh_add_file "zsh-prompt"
# }}}
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "agkozak/zsh-z"
zsh_add_plugin "kutsan/zsh-system-clipboard"
bindkey -M vicmd Y zsh-system-clipboard-vicmd-vi-yank-eol
zsh_add_plugin "MichaelAquilina/zsh-you-should-use"
zsh_add_folder "personal"

# Add scripts to the path
# zsh_add_scripts
# }}}
# completions again {{{
autoload -Uz compinit && compinit
zmodload zsh/complist
# }}}
# external customisations {{{
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}
#} vim:foldmethod=marker:foldlevel=1
