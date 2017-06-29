# Navigation aliases
alias desk='cd ~/Desktop'
alias phd='cd ~/phd/'
alias data='cd ~/data'
alias code='cd ~/code'

# Utility aliases
alias eject='diskutil unmount'
alias p='cd ~/code/puffs/analysis/c8'
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
alias whoami='echo 24601'
eval $(thefuck --alias)

grabjb_rsync ()
{
    rsync -vrhzP --inplace --progress apps:/jukebox/wang/deverett/$1 ${2:-.}
}
grabjb ()
{
    globus transfer --encrypt --sync-level size $GLB_BUCKET:/jukebox/wang/deverett/$1 $GLB_LOCAL:$(pwd)/${2:-$1}
}
grab ()
{
    rsync -vrhzP --inplace --progress apps:~/$* .
}
grabwang ()
{
    rsync -vrhzP --inplace --progress apps:/jukebox/wang/$* .
}
grabfs_rsync ()
{
    rsync -vrhzP --inplace --progress apps:/fastscratch/deverett/$* .
}
grabfs ()
{
    globus transfer --encrypt --sync-level size $GLB_BUCKET:/fastscratch/deverett/$1 $GLB_LOCAL:$(pwd)/${2:-$1}
}
grabpuffs ()
{
    globus transfer --encrypt --sync-level size $GLB_BUCKET:/fastscratch/deverett/puffs/$1 $GLB_LOCAL:$(pwd)/${2:-$1}
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

# kill crashplan
launchctl unload ~/Library/LaunchAgents/com.crashplan.engine.plist

# anaconda 2.3.0
#export PATH="/Users/ben/anaconda/bin:$PATH"
#source activate py35

# globus, added by BD april 10 2017
export GLB_BUCKET=6ce834d6-ff8a-11e6-bad1-22000b9a448b
export GLB_LOCAL=08929a00-1e28-11e7-bc2c-22000b9a448b
globus endpoint activate $GLB_BUCKET

# clear all
clear && printf '\e[3J'

# show tmux sessions
if tmux info &> /dev/null; then 
      tmux ls
fi

# added by Anaconda3 4.2.0 installer
export PATH="/Users/ben/anaconda/bin:$PATH"
