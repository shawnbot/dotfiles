export PROMPT="%n@%m:%B%~%b%# "
export PATH="$HOME/bin:$PATH"
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export RSYNC_RSH=ssh

# prioritize Homebrew and other locally installed binaries
export NODE_PATH="/usr/local/share/npm/bin"
export GDAL_PATH="/Library/Frameworks/GDAL.framework/Programs"
# Homebrew Python packages (like cairo)
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
export PATH="$GDAL_PATH:$NODE_PATH:/usr/local/bin:$PATH"
