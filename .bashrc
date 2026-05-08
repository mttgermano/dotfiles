# Alias ----------------------------------------------------------------------------------------------------------------
alias py="python3"
alias pip="python3.10 -m pip"
alias ls="ls --color=always --group-directories-first"
alias rm="rm -i"
alias src="source /home/$(whoami)/.bashrc"
shopt -s checkwinsize

# Variables -------------------------------------------------------------------------------------------------------------
#Full name
#export PS1="\[\e[34m\]\u\[\e[36m\]@\h\[\e[00m\] in \[\e[35m\]\w\[\e[00m\] \n\[\e[32m\][🦕]-→ \[\e[37m\]"

#Short name
export PS1="\[\e[34m\]mttgermano\[\e[36m\]@\h\[\e[00m\] in \[\e[35m\]\w\[\e[00m\] \n\[\e[32m\][🦕]→ \[\e[37m\]    "
export EDITOR="vim"

# Sets -------------------------------------------------------------------------------------------------------------------
set -o vi
bind -m vi-command  'Control-l: clear-screen'      
bind -m vi-insert   'Control-l: clear-screen'

# Scripts ----------------------------------------------------------------------------------------------------------------

#Se o vim não está no modo interativo, não faça nada no terminal
#[[ $- != *i* ]] && return

# Binds ------------------------------------------------------------------------------------------------------------------
pathadd() {
    if [ -d "$1" ] && [[ ! $PATH =~ (^|:)$1(:|$) ]]; then
        PATH+=:$1
    fi
}
pathadd /home/$(whoami)/scripts

# Curl this file! ---------------------------------------------------------------------------------------------------------
# curl -LJO https://raw.githubusercontent.com/mttgermano/LP1/main/.bashrc
