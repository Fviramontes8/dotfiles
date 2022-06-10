if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

PS1="${PS1:0:-3}\[\033[35m\]\$(parse_git_branch)\[\033[00m\]\$ "
