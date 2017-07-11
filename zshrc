autoload -U compinit && compinit
bindkey -v
set CASE_GLOB
umask 002

alias gitlog=git log --graph --pretty="format:%h %cn - %s %d (%cr)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
