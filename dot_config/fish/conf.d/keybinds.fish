status is-interactive || exit
# use `set -g` instead as otherwise autopairs stops working
set -g fish_key_bindings fish_vi_key_bindings
bind -M insert \cf forward-char
bind -M insert \cb backward-char
bind -M insert \ca beginning-of-line
bind -M insert \ce end-of-line
bind -M insert \cw backward-kill-bigword
bind -M insert \cy yank
bind -M insert \ck kill-line

bind -M insert ctrl-space forward-bigword
