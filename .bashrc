GIT_COMPLETIONS=/usr/share/bash-completion/completions/git

### IMPORTS ###
[ -e $GIT_COMPLETIONS ] && source $GIT_COMPLETIONS || echo "git completion not found"

### COLORS ###
# Important note here:
# wrapping all colors (or any other variable that is supposed to have 0 length on the PS1)
# in \[...\] is ESSENTIAL!!!! Otherwise the underlying readline utility will think
# that there are more characters on the line and it will cause line wrapping bugs
RESET="\[\e[0m\]"

BLACK="\[\e[30m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"
LIGHT_GRAY="\[\e[37m\]"
DARK_GRAY="\[\e[90m\]"
LIGHT_RED="\[\e[91m\]"
LIGHT_GREEN="\[\e[92m\]"
LIGHT_YELLOW="\[\e[93m\]"
LIGHT_BLUE="\[\e[94m\]"
LIGHT_MAGENTA="\[\e[95m\]"
LIGHT_CYAN="\[\e[96m\]"
WHITE="\[\e[97m\]"

PS1="$GREEN\w$WHITE\$$RESET "

# setup ls
if [ -x /usr/bin/dircolors ]; then
  eval "$(dircolors -b)"

fi

alias ls='ls --color=auto'
alias la='ls -la'

### Settings
HISTCONTROL=ignoreboth:erasedups

### lanuch tmux
# NOTE: this won't trigger an infinite loop
# (one that opens a tmux inside a tmux, since tmux reads .bashrc)
# as long as tmux has the $TMUX lock.
[ -x /usr/bin/tmux ] && [ $TERM = 'xterm-kitty' ] && tmux && exit
