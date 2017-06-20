autoload -U compinit && compinit
bindkey -v
set CASE_GLOB
umask 002

alias gitlog=git log --graph --pretty="format:%h %cn - %s %d (%cr)"

export NVM_DIR="/Users/allens/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
