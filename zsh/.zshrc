# Use emacs keybindings even if EDITOR is set to vi
bindkey -e

# Fix Del key
bindkey "^[[3~" delete-char

setopt appendhistory histignorealldups histignorespace

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Disable menu completion
unsetopt automenu

# C-X C-E to edit the current command line in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

alias g='git status'
alias t='task'

command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"
command -v kubectl >/dev/null 2>&1 && source <(kubectl completion zsh)
source ~/.magnit_autocomplete.zsh
