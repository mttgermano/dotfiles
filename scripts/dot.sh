#!/bin/bash

function clop(){
    path+="$1/"
   
    for FILE in $path{.[!.]*,*}; do
        f=$(basename $FILE)
        checkpath="$HOME/${FILE#$basepath/}"
        echo "checkpath: $checkpath"
        ((VFILES+=1))

        [[ -f "$checkpath" ]] && cp $checkpath $path 
        [[ -d "$checkpath" ]] && clop $f
    done
    path=${path%$1/}
}


basepath=$HOME/dotfiles
path=$basepath

if [[ $#  -eq 0 ]]; then
    echo "-------------------------"
    echo "Wrong Use"
    echo "You must give a parameter"
    echo "-------------------------"

elif [[ $1 == "source" ]]; then
    # Later, create a progressbar
    NFILES=$(tree -a $HOME/dotfiles/ | tail -n 1 | cut -d " " -f 3)
    VFILES=0
    clop
    (cd $HOME/dotfiles/; git diff && git add . && git commit -m "update" && git push)
else
    if [[ -d $1 ]]; then
        cp -r $1 /home/matt/dotfiles/$2/$1
    else
         cp $1 /home/matt/dotfiles/$2/$1
    fi
fi

