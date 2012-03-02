# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jgosmann"
#ZSH_THEME=""

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
setopt CORRECT # redundant
setopt NO_BG_NICE

# not redundant
# unset hist_ignore_dups and share_history?
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

autoload colors zsh/terminfo
colors

alias mysqlstart="sudo /opt/local/bin/mysqld_safe5"
alias mysqlstop="/opt/local/bin/mysqladmin5 -u root -p shutdown"
alias postgres-restart="sudo -u postgres /Library/PostgreSQL/9.0/bin/pg_ctl -D /Library/PostgreSQL/9.0/data restart"
if ! (type -p netcat > /dev/null); then
    alias netcat=nc
fi

export CLICOLOR=''
export EDITOR=vim
export PAGER='less -is' #REDUNDAND?

typeset -U path
path=(/opt/local/bin $path ~/bin)
export -TU PYTHONPATH pythonpath
pythonpath=($pythonpath ~/bin/python/lib/python)

bindkey -v
# Add magic space? Fn + Delete!!
# jump to beginnig/end of line
bindkey -M vicmd 'gg' beginning-of-history
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo
bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^?' backward-delete-char

bindkey -M vicmd 'g~' vi-oper-swap-case

bindkey -M viins '^R' history-incremental-search-backward
bindkey -M viins '^S' history-incremental-search-forward
# Could also use accept-and-down-history
bindkey -M viins '^X^N' accept-and-infer-next-history
bindkey -M viins '\e.' insert-last-word

bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line

bindkey -M viins '^Q' push-line-or-edit

# exchange-point-and-mark
# copy paste with mark jumping


bindkey -M viins '^[[Z' reverse-menu-complete
zmodload -i zsh/complist # redundant with oh-my-zsh
zstyle ':completion:*' menu select=2 # redundant
bindkey -M menuselect '^o' accept-and-infer-next-history # redundant
bindkey -M menuselect '^M' .accept-line
zstyle ':completion:*' use-compctl false # keep in?

zstyle ':completion:*' list-colors '' # redundant

zstyle ':completion:*:*:open:*' ignored-patterns '*?.bib' '*?.aux' '*?.bbl' '*?.bcf' '*?.blg' '*?.log' '*?.out' '*?.xml' '*?.synctex.gz' '*?.tex'
zstyle ':completion:*:*:kill:*' command 'ps -r -u$USER' # check redundant

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*' completer _complete _approximate:-one _complete:-extended _approximate:-four
zstyle ':completion:*:approximate-one:*' max-errors 1
zstyle ':completion:*:complete-extended:*' matcher 'r:|[.,_-]=* r:|=*' # redundant?
zstyle ':completion:*:approximate-four:*' max-errors 4
