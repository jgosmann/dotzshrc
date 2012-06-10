
bindkey -M viins -r 'jk'
bindkey -M viins -r 'kj'
bindkey -M vicmd 'gg' beginning-of-history
bindkey -M vicmd 'g~' vi-oper-swap-case
bindkey -M viins "$key_info[Control]S" prepend-sudo
bindkey -M viins "$key_info[Control]N" accept-and-infer-next-history
bindkey -M viins "$key_info[Control]A" beginning-of-line
bindkey -M viins "$key_info[Control]E" end-of-line
bindkey -M viins "$key_info[Control]U" kill-whole-line

zmodload zsh/complist # To be able to access menuselect keymap
bindkey -M menuselect '^o' accept-and-infer-next-history

lesskey ~/.zsh/lesskey

