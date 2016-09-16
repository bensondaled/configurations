# Navigation aliases
alias desk='cd ~/Desktop'
alias phd='cd ~/phd/'
alias data='cd ~/data'
alias code='cd ~/code'

# Utility aliases
alias eject='diskutil unmount'
alias p='cd ~/code/puffs/analysis/c5'
alias py='ipython'
alias jn='jupyter notebook'
alias py3='source deactivate;source activate py35'
alias py2='source deactivate;source activate py2'
alias password='pswd'
alias rondo='ssh rondo'
alias spock='ssh spock'
alias workon='~/.custom/bin/start_coding.sh'
alias rm='rm -i'
alias gm='git commit -m'
alias gp='git push'
alias ga='git add -A .'
alias gt='git status'

grabjb ()
{
    rsync -vrhzP --inplace --progress apps:/jukebox/wang/deverett/$1 ${2:-.}
}
grab ()
{
    rsync -vrhzP --inplace --progress apps:~/$* .
}
grabwang ()
{
    rsync -vrhzP --inplace --progress apps:/jukebox/wang/$* .
}
grabfs ()
{
    rsync -vrhzP --inplace --progress apps:/fastscratch/deverett/$* .
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
export PYTHONPATH=$PYTHONPATH:$(find /Users/ben/code/ -maxdepth 1 -mindepth 0 -type d | tr '\n' ':')
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
