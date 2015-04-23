autoload -U compinit && compinit
bindkey -v
set CASE_GLOB
umask 002

alias cleanup=find . -name ._\* -exec rm "{}" \;
alias gitlog=git log --graph --pretty="format:%h %cn - %s %d (%cr)"

alias insert-license="wget -q https://raw.githubusercontent.com/18F/open-source-policy/master/LICENSE.md"
alias insert-contrib="wget -q https://raw.githubusercontent.com/18F/open-source-policy/master/CONTRIBUTING.md"
alias 18f-init="insert-license && insert-contrib && echo 'Licensed.'"

export NVM_DIR="/Users/allens/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
