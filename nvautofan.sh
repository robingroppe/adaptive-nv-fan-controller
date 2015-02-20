#!/bin/bash
interval=3
while true; do
current_temp=`nvidia-settings -t -q [GPU:0]/GPUCoreTemp`
if [ "$current_temp" -le "23" ]; then bash /home/robin/.bin/nvfanctl.sh min
elif [ "$current_temp" -le "35" ]; then bash /home/robin/.bin/nvfanctl.sh down
elif [ "$current_temp" -le "55" -a "$current_temp" -gt "35" ]; then sleep "$interval"
elif [ "$current_temp" -gt "55" ]; then bash /home/robin/.bin/nvfanctl.sh up
elif [ "$current_temp" -gt "58" ]; then bash /home/robin/.bin/nvfanctl.sh max
fi
sleep "$interval"
done
