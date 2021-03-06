## Rondo admins
if [ -z "$ENVONLY" ]
then
	# Set the interrupt character to Ctrl-c and do clean backspacing.
	if [ -t 0 ]
	then
		stty intr '^C' echoe 
	fi

	# Set the TERM environment variable
	eval `tset -s -Q`
fi
# Set the default X server.
if [ ${DISPLAY:-setdisplay} = setdisplay ]
then
    if [ ${REMOTEHOST:-islocal} != islocal ]
    then
        DISPLAY=${REMOTEHOST}:0
    else
        DISPLAY=:0
    fi
    export DISPLAY
fi

## Ben's additions
module load python
PS1=">> "
alias ks='ls'
alias py='ipython'
alias workon='~/.custom_bin/launch_programming_session'
alias tma='tmux attach'
alias rm='rm -i'
alias jb='cd /jukebox/wang/deverett'
alias q='qrsh'
alias pyenv='source activate myenv'
export PYTHONPATH=~/.custom_resources/python
export PYTHONPATH="/usr/people/deverett/pkgs/pyfluo:$PYTHONPATH"
