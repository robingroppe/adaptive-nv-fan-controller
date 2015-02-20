#!/bin/bash
# read the current fan speed from nvidia-settings
current_speed=`nvidia-settings -t -q [fan:0]/GPUCurrentFanSpeed`
new_speed=26

#read arguments from command line
case "$1" in
#if argument is "up", increase fan speed by 2%, unless already at 100%
"up")    let "new_speed = $current_speed + 2"
if [ $new_speed -gt 100 ]
then
new_speed=100
fi
eval "nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUCurrentFanSpeed=$new_speed"
;;
#if argument is "down", decrease fan speed by 2%, unless already at 26%
"down")    let "new_speed = $current_speed - 2"
if [ $new_speed -lt 26 ]
then
new_speed=26
fi
eval "nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUCurrentFanSpeed=$new_speed"
;;
#if "min", set fan speed to 26%
"min")    nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUCurrentFanSpeed=26
;;
#if "max", set fan speed to 100%
"max")    nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUCurrentFanSpeed=100
;;
#if "mid", set fan speed to 50%
"mid")    nvidia-settings -a [gpu:0]/GPUFanControlState=1 -a [fan:0]/GPUCurrentFanSpeed=50
;;
esac
exit 0
