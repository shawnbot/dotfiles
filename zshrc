autoload -U compinit && compinit
bindkey -v
set CASE_GLOB
umask 002

alias cleanup=find . -name ._\* -exec rm "{}" \;
alias gitlog=git log --graph --pretty="format:%h %cn - %s %d (%cr)"
