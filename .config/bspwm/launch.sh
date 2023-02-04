#! /bin/sh

picom --config $HOME/.config/picom/picom.conf &
dunst -config $HOME/.config/dunst/dunstrc &
#$HOME/.config/pywal/pywal.sh &
#lf -config $HOME/.config/lf/lfrc &
#$HOME/.config/eww/dashboard/launch.sh &
$HOME/.fehbg &
$HOME/.config/polybar/launch.sh
