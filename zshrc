#
# Sets Oh My Zsh options.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Own functions
fpath=(~/.zsh/functions $fpath)
autoload -Uz prompt_jgosmann_setup

# Set the path to Oh My Zsh.
export OMZ="$HOME/.zsh/oh-my-zsh"

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':omz:module:editor' keymap 'vi'

# Auto convert .... to ../..
zstyle ':omz:module:editor' dot-expansion 'no'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':omz:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':omz:module:terminal' auto-title 'no'

# Set the Zsh modules to load (man zshmodules).
# zstyle ':omz:load' zmodule 'attr' 'stat'

# Set the Zsh functions to load (man zshcontrib).
# zstyle ':omz:load' zfunction 'zargs' 'zmv'

# Set the Oh My Zsh modules to load (browse modules).
zstyle ':omz:load' omodule 'environment' 'terminal' 'editor' 'completion' \
  'history' 'directory' 'spectrum' 'alias' 'utility' 'git' 'prompt' 'macports' \
  'syntax-highlighting'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':omz:module:prompt' theme 'jgosmann'

# This will make you shout: OH MY ZSHELL!
source "$OMZ/init.zsh"

# Customize to your needs...

setopt HUP
setopt CHECK_JOBS
unsetopt SHARE_HISTORY
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[command]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'

path=(/opt/local/bin $path ~/bin)

bindkey -M viins -r 'jk'
bindkey -M viins -r 'kj'
bindkey -M vicmd 'gg' beginning-of-history
bindkey -M vicmd 'g~' vi-oper-swap-case
bindkey -M viins "$key_info[Control]S" prepend-sudo
bindkey -M viins "$key_info[Control]N" accept-and-infer-next-history
bindkey -M viins "$key_info[Control]A" beginning-of-line
bindkey -M viins "$key_info[Control]E" end-of-line
bindkey -M viins "$key_info[Control]U" kill-whole-line

zmodload zsh/complist
bindkey -M menuselect '^o' accept-and-infer-next-history

zstyle ':completion:*:*:open:*' ignored-patterns '*?.bib' '*?.aux' '*?.bbl' \
    '*?.bcf' '*?.blg' '*?.log' '*?.out' '*?.xml' '*?.synctex.gz' '*?.tex'

alias gsr='git svn rebase'
alias gsd='git svn dcommit --rmdir'

alias mysqlstart="sudo /opt/local/bin/mysqld_safe5"
alias mysqlstop="/opt/local/bin/mysqladmin5 -u root -p shutdown"
alias postgres-restart="sudo -u postgres /Library/PostgreSQL/9.0/bin/pg_ctl -D /Library/PostgreSQL/9.0/data restart"
if ! (type -p netcat > /dev/null); then
    alias netcat=nc
fi

