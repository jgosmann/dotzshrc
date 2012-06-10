#
# Sets Oh My Zsh options.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Jan Gosmann <jan@hyper-world.de>
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
zstyle ':omz:*:*' case-sensitive 'yes'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':omz:module:terminal' auto-title 'no'

# Set the Zsh modules to load (man zshmodules).
 #zstyle ':omz:load' zmodule 'attr' 'stat'

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

function load() {
    if [ -f "$1" ]; then
        . "$1"
    fi
}

setopt CHECK_JOBS
setopt CLOBBER
setopt HUP
unsetopt SHARE_HISTORY

export EDITOR='vim'
export PAGER='less -i'
export VISUAL='vim'

path=($path ~/bin)

load ~/.zsh/alias.zsh
load ~/.zsh/completion.zsh
load ~/.zsh/keys.zsh
load ~/.zsh/syntax.zsh

case `uname` in
    *Darwin*)
        load ~/.zsh/osx.zsh
        ;;
esac

unfunction load

