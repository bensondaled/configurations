# Navigation aliases
alias desk='cd ~/Desktop'
alias phd='cd ~/phd/'
alias data='cd ~/data'
alias code='cd ~/code'

# Utility aliases
alias eject='diskutil unmount'
alias p='cd ~/code/puffs/analysis/c10'
alias py='ipython'
alias jn='jupyter notebook'
alias py2='source deactivate;source activate py2'
alias password='pswd'
alias rondo='ssh rondo'
alias spock='ssh spock'
alias arizona='ssh arizona'
alias workon='~/.custom/bin/start_coding.sh'
alias rm='rm -i'
alias gm='git commit -m'
alias gp='git push'
alias ga='git add -A .'
alias gt='git status'
alias whoami='echo 24601'
alias fcount='ffprobe -v error -count_frames -select_streams v:0 -show_entries stream=nb_read_frames -of default=nokey=1:noprint_wrappers=1'

export PATH="~/.custom/bin:$PATH"

# Typo aliases
alias ks='ls'
alias ;s='ls'
alias sl='ls'
alias cd..='cd ..'

# Aesthetic modifications
PS1="> "

# python
export PYTHONPATH="$PYTHONPATH:/Users/ben/.custom_resources/python"
export PYTHONPATH=$PYTHONPATH:$(find /Users/ben/code/ -maxdepth 1 -mindepth 0 -type d | tr '\n' ':')
export LD_LIBRARY_PATH="/usr/local/bin:/usr/local/lib:$LD_LIBRARY_PATH"
export PATH="/anaconda/bin:$PATH"
export PATH="/Users/ben/anaconda/bin:$PATH"
alias vim='/usr/local/Cellar/vim/8.0.1175/bin/vim'
# environment
source deactivate
source activate py37

# tmux
#source ~/.custom_resources/tmux/bash_completion_tmux.sh
# show tmux sessions
if tmux info &> /dev/null; then 
      tmux ls
fi

# clear all
desk
clear && printf '\e[3J'
