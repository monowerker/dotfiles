# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
#set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins git vi-mode node

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Override ls -G function
function ls ; command ls ; end
funcsave ls

# set CDPATH
set -g -x CDPATH[1] .
set -g -x CDPATH[2] ~/Dropbox/Projects

# set PATH
_append_path /opt/local/bin
_append_path /opt/local/sbin
