if playerctl status >/dev/null 2>&1; then
    player_status=$(playerctl status)
    if [[ $player_status == "Playing" ]]; then
        echo '{"text": "'"<span foreground='#bb9af7'></span>   $(playerctl metadata title)"'", "class": "Playing"}'
    elif [[ $player_status == "Paused" ]]; then
        echo '{"text": "'"<span foreground='#bb9af7'></span>   $(playerctl metadata title)"'", "class": "Paused"}'
    else
        echo '{"text": "'"<span foreground='#bb9af7'> </span> 未在播放"'", "class": "Stopped"}'
    fi
else
    echo '{"text": "'"<span foreground='#bb9af7'> </span> 未在播放"'", "class": "Stopped"}'
fi

#!/bin/bash

# check_mpd() {
#     if command -v mpc &> /dev/null; then
#         mpd_status=$(mpc status 2>/dev/null)
#         if [[ $? -eq 0 ]]; then
#             mpd_playing=$(echo "$mpd_status" | grep -c "\[playing\]")
#             mpd_paused=$(echo "$mpd_status" | grep -c "\[paused\]")
#             if [[ $mpd_playing -eq 1 ]]; then
#                 echo '{"text": "'"<span foreground='#bb9af7'></span>   $(mpc current -f '%title%')"'", "class": "Playing"}'
#                 return 0
#             elif [[ $mpd_paused -eq 1 ]]; then
#                 echo '{"text": "'"<span foreground='#bb9af7'></span>   $(mpc current -f '%title%')"'", "class": "Paused"}'
#                 return 0
#             fi
#         fi
#     fi
#     return 1
# }

# if playerctl status >/dev/null 2>&1; then
#     player_status=$(playerctl status)
#     if [[ $player_status == "Playing" ]]; then
#         echo '{"text": "'"<span foreground='#bb9af7'></span>   $(playerctl metadata title)"'", "class": "Playing"}'
#     elif [[ $player_status == "Paused" ]]; then
#         echo '{"text": "'"<span foreground='#bb9af7'></span>   $(playerctl metadata title)"'", "class": "Paused"}'
#     else
#         check_mpd || echo '{"text": "'"<span foreground='#bb9af7'> </span> 未在播放"'", "class": "Stopped"}'
#     fi
# else
#     check_mpd || echo '{"text": "'"<span foreground='#bb9af7'> </span> 未在播放"'", "class": "Stopped"}'
# fi
