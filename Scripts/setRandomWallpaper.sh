#!/bin/bash
export DISPLAY=:0
directory=~/Wallpapers/

if [ -d $directory ]; then
	randomImage=$directory$(ls $directory | shuf -n 1)
	feh --bg-scale $randomImage 
fi
