# Navigation aliases
alias desk='cd ~/Desktop'
alias phd='cd ~/phd/'
alias code='cd ~/code'

# Utility aliases
alias eject='diskutil unmount'
alias py='ipython'
alias password='pswd'
alias rondo='ssh rondo'
alias workon='~/.custom/bin/launch_programming_session'
alias rm='rm -i'
grabjb ()
{
    rsync -vrhz --progress apps:/jukebox/wang/deverett/$* .
}
grab ()
{
    rsync -vrhz --progress apps:~/$* .
}

# Typo aliases
alias ks='ls'
alias ;s='ls'
alias sl='ls'
alias cd..='cd ..'

# Aesthetic modifications
PS1="> "

# Custom paths
export PYTHONPATH="$PYTHONPATH:/Users/ben/.custom_resources/python"
export PYTHONPATH=$PYTHONPATH:$(find /Users/ben/code/ -maxdepth 1 -mindepth 1 -type d | tr '\n' ':')
#export PATH=/Users/Benson/.personal/:$PATH
export LD_LIBRARY_PATH="/usr/local/bin:/usr/local/lib:$LD_LIBRARY_PATH"

# tmux
source ~/.custom_resources/tmux/bash_completion_tmux.sh

# anaconda 2.3.0
export PATH="/Users/ben/anaconda/bin:$PATH"
source activate py35

# clear all
clear && printf '\e[3J'

# show tmux sessions
if tmux info &> /dev/null; then 
      tmux ls
fi
