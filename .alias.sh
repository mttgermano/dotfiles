# Alias ########################################################
alias cat="bat"
alias dirfonts="cd /home/matt/.local/share/fonts/"
alias dot="dot.sh"
#alias env_start="source /home/matt/prog/projects/env/bin/activate" 
alias env_start="source ./env/bin/activate" 
alias env_stop="deactivate"
alias j="julia"
alias ls="lsd --group-directories-first -X"
alias ll="lsd --group-directories-first -lah"
alias poweroff="sudo systemctl poweroff"
alias py="python"
alias pwc="pwd | xclip"
alias src="source /home/matt/.bashrc"
alias update="sudo pacman -Syu"
alias xclip="xclip -selection clipboard"

# Functions ####################################################
# If a command is builtin, use the keywords function and builtin 
mk (){ 
    builtin mkdir -p $1
    cd $1
}

function cd { 
    builtin cd $1
    ls
}

jmp (){
    cd $(find /home/matt/* -type d | fzf)
}

zombies (){
    var=$(ps aux | grep 'Z' | wc -l)
    var=$((var -2))
    if [[ var -gt 0 ]]; then
        echo "Ooops, you have $var Zombie Process"
    else
        echo "No Zombie Process!"
    fi
}

