export PROMPT="shawnbot@github:%B%~%b%# "
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export RSYNC_RSH=ssh

# prioritize Homebrew and other locally installed binaries
export NODE_PATH="/usr/local/lib/node_modules:/usr/local/lib/node"
export GDAL_PATH="/Library/Frameworks/GDAL.framework/Programs"
export PATH="$NODE_PATH:$PATH"

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/work
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
virtualenvwrapper='/usr/local/bin/virtualenvwrapper.sh'
if [ -f $virtualenvwrapper ]; then
    source $virtualenvwrapper;
fi

# activate virtualenv in sub-shells (e.g. inside screen)
if [ "$VIRTUAL_ENV" ]; then 
    source $VIRTUAL_ENV/bin/activate; 
fi

# autoenv
autoenv_activate='/usr/local/opt/autoenv/activate.sh'
if [ -f $autoenv_activate ]; then
    source $autoenv_activate;
fi

# rvm
if [ -f ~/.rvm ]; then
    source ~/.rvm/scripts/rvm;
fi

# nvm
if [ -f $HOME/.nvm ]; then
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh
fi
