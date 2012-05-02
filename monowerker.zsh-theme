PINK=$'\e[35;40m'
GREEN=$'\e[32;40m'
ORANGE=$'\e[33;40m'

export PROMPTCHAR='>'
PROMPT='%{$fg[blue]%}%~%{$reset_color%}
%{$fg[red]%}%n@%m% $PROMPTCHAR%{$reset_color%} '

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/C}/(main|viins)/I}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

