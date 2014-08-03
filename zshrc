# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="monowerker"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
#export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ssh-agent git github vi-mode osx autojump terminalapp macports)

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa codebase_rsa github_rsa

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

unalias mv # remove oh-my-zsh alias
unalias mkdir # remove oh-my-zsh alias

setopt AUTO_PUSHD
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt CORRECT
setopt NO_BEEP
setopt AUTOLIST
unsetopt MENUCOMPLETE
setopt REC_EXACT

export EDITOR=vim
export VISUAL="mvim -f"
export MP_EDITOR=subl
export GIT_EDITOR=vim
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export NODE_PATH="/opt/local/lib/node_modules"
export GOPATH="/Users/deric/go"
export CDPATH=.:~/Dropbox/Projects
export GOROOT=$HOME/go

if [[ -x vim ]]; then
    export EDITOR='vim'
else
    export EDITOR='vi'
fi

alias ls='ls -G'
alias sudo='A=`alias` sudo '
alias ipy='ipython'
alias ppj='python -mjson.tool'
alias sub='subl'
alias bp='bpython'

autoload -Uz compinit
compinit
zstyle ':completion:*' special-dirs true 

# http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html

export MARKPATH=$HOME/.marks
function jump { 
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

function mark { 
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}

function unmark { 
    rm -i "$MARKPATH/$1"
}

function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

function _completemarks {
  reply=($(ls $MARKPATH))
}

compctl -K _completemarks jump
compctl -K _completemarks unmark

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

#ssh-add -K $HOME/.ssh/*_rsa
