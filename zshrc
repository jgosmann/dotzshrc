#
# Sets Oh My Zsh options.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

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
zstyle ':omz:module:terminal' auto-title 'yes'

# Set the Zsh modules to load (man zshmodules).
# zstyle ':omz:load' zmodule 'attr' 'stat'

# Set the Zsh functions to load (man zshcontrib).
# zstyle ':omz:load' zfunction 'zargs' 'zmv'

# Set the Oh My Zsh modules to load (browse modules).
zstyle ':omz:load' omodule 'environment' 'terminal' 'editor' 'completion' \
  'history' 'directory' 'spectrum' 'alias' 'utility' 'git' #'prompt'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
#zstyle ':omz:module:prompt' theme 'sorin'
MODE_INDICATOR='%U'
function zle-line-init zle-keymap-select {
  zle reset-prompt
}

#zle -N zle-line-init
#zle -N zle-keymap-select

#bindkey -v

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

 zstyle ':omz:module:git' added '%F{yellow}'
 zstyle ':omz:module:git' ahead '↑'
 zstyle ':omz:module:git' behind '↓'
 zstyle ':omz:module:git' branch '%b'
 zstyle ':omz:module:git' clean '%F{green}'
 zstyle ':omz:module:git' dirty '%F{red}'
 zstyle ':omz:module:git' renamed '%F{yellow}'

 zstyle ':omz:module:git' action '%F{magenta}%s%f'
 zstyle ':omz:module:git' unmerged '%F{magenta}(%U)%f'
 zstyle ':omz:module:git' stashed '%F{magenta}✭%f'
 zstyle ':omz:module:git' untracked '%F{magenta}?%f'
 zstyle ':omz:module:git' commit '%F{blue}%c%f'

 zstyle ':omz:module:git' remote '%R'
 zstyle ':omz:module:git:prompt' position '%p'
 zstyle ':omz:module:git' deleted 'd'
 zstyle ':omz:module:git' modified 'm'
 # Ignore submodule when it is 'dirty', 'untracked', 'all', or 'none'.
 zstyle ':omz:module:git:ignore' submodule ''

 # Prompts.
 zstyle ':omz:module:git' info \
   'prompt'   '%C%D%r%a%b' \
   'rprompt'  '%s%U %S%u %10>>%c' \
   'position' '%A%B'

function prompt_precmd {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS

  if (( $+functions[git-info] )); then
    git-info
  fi
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_precmd

function git_prompt_info() {
  git rev-parse 2> /dev/null || return
  ref=$(git symbolic-ref HEAD 2> /dev/null || print '(no branch)')
  echo "$(git_prompt_ahead)$(parse_git_dirty)${ref#refs/heads/}"
}

zstyle ':omz:module:editor' completing '%B%F{red}...%f%b'
zstyle ':omz:module:editor:keymap:primary' overwrite '%S'
zstyle ':omz:module:editor:keymap' alternate '%U'

setopt PROMPT_SUBST
PROMPT='${editor_info[keymap]}${editor_info[overwrite]}%m:%F{blue}%1~%f${git_info:+${${git_info[position]/↑↓/↕}:-|}${(e)git_info[prompt]}}%{%(?.%F{green}.%F{red})%}%(!.#.>)%f%s%u '
RPROMPT='%(?..%F{red}%?%f )${git_info:+${git_info[rprompt]}}'
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# This will make you shout: OH MY ZSHELL!
source "$OMZ/init.zsh"

# Customize to your needs...

