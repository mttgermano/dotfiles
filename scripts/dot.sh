#!/bin/bash

function clop(){
    path+="$1/"
    echo "-------------------------------"
    echo "$path"
    
    for FILE in $path{.[!.]*,*}; do
        f=$(basename $FILE)
        checkpath="$HOME/${FILE#$basepath/}"
        echo "checkpath: $checkpath"

        [[ -f "$checkpath" ]] && cp $checkpath $path 
        [[ -d "$checkpath" ]] && clop $f
    done
    path=${path%$1/}
    echo "$path"
}

basepath=$HOME/dotfiles
path=$basepath

if [[ $#  -eq 0 ]]; then
    echo "-------------------------"
    echo "Wrong Use"
    echo "You must give a parameter"
    echo "-------------------------"

elif [[ $1 == "source" ]]; then
    clop
    git add . && git commit -m "update" && git push
else
    if [[ -d $1 ]]; then
        cp -r $1 /home/matt/dotfiles/$2/$1
    else
         cp $1 /home/matt/dotfiles/$2/$1
    fi
fi

