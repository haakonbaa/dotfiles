# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# spaceship
source "$HOME/dotfiles/download/.zsh/spaceship/spaceship.zsh"

set -o vi

mat () {
    COMMAND="matlab -nodisplay -nosplash -nodesktop"
    if [ -z "$1" ] ; then
        eval matlab -nodisplay -nosplash -nodesktop
    else
        matlab -nodisplay -nosplash -nodesktop -r "run('$(pwd)/$1');exit;"
    fi
}


PATH=/usr/local/go/bin/:$PATH
PATH=$HOME/Downloads/google-cloud-sdk/bin/:$PATH

alias nmapl='nmap -sn 192.168.1.1/24'

dimscreen() {
    local screens="$(xrandr | grep ' connected' | cut -f1 -d ' ')"
    for screen in $screens
    do
        xrandr --output $screen --brightness $1
    done
}
