
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/bdd/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bdd/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/bdd/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bdd/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=/Users/bdd/.custom/bin:$PATH
alias workon='~/.custom/bin/bd_coding_environment.sh'
alias desk='cd ~/Desktop'
alias ks='ls'
alias sl='ls'
alias ;s='ls'
alias rm='rm -i'
alias py='ipython'
alias gt='git status'
alias gp='git push'
alias gm='git commit -m'
alias ga='git add -A'
alias cloud='cd /Users/bdd/cloud/'
alias code='cd /Users/bdd/code/'
alias py312='source activate py312'

py312
PS1='> '
clear
