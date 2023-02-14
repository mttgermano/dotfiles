# Alias ########################################################
alias src="source /home/matt/.bashrc"
alias ls="lsd --group-directories-first -X"
alias ll="lsd --group-directories-first -lah"
alias cat="bat"
alias xclip="xclip -selection clipboard"
alias pwc="pwd | xclip"
alias poweroff="sudo systemctl poweroff"
alias j="julia"
alias py="python"
alias start="source ./env/bin/activate"
alias dirfonts="cd /home/matt/.local/share/fonts/"
alias dot="dot.sh"

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

zombies (){
    var=$(ps aux | grep 'Z' | wc -l)
    var=$((var -2))
    if [[ var -gt 0 ]]; then
        echo "Ooops, you have $var Zombie Process"
    else
        echo "No Zombie Process!"
    fi
}
