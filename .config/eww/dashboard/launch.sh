#! /bin/bash

###      Variables      ###
FILE="/home/matt/.config/eww/launch.sh"
CFG="/home/matt/.config/eww/dashboard"
EWW="/home/matt/.config/eww/target/release/eww"
#EWW=`which eww`

###      Run if not running      ###
if [[ ! `pidof eww` ]]; then
    ${EWW} daemon
    sleep 1
fi

###     Run Widgets         ###
run_eww(){
    ${EWW} --config "$CFG" open-many \
    profile \
    wallpaper_selector \
    file_manager \
    vpn \
    gif \
    poweroff \
    reboot \
    sleep \
    logout 
#   background \
}

run_eww
