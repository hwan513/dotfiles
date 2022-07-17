 eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
. "/Users/henrywang/.config/cargo/env"

# zsh config dir
export ZDOTDIR=$HOME/.config/zsh
export VISUAL=nvim
export EDITOR="$VISUAL"
export BROWSER=firefox
 
