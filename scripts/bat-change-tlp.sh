#!/bin/sh

file="/etc/tlp.d/01-default-mode.conf"

if cat $file | grep -q BAT;
then
	if [ -n "$(tail -c1 $file)" ]
	then
		sudo truncate -s-3 $file
	else
		sudo truncate -s-4 $file
	fi
	mode="AC"
else
	if [ -n "$(tail -c1 $file)" ]
	then
		sudo truncate -s-2 $file
	else
		sudo truncate -s-3 $file
	fi
	mode="BAT"
fi

echo "$mode" >> $file
sudo tlp start
hyprctl notify -0 2000 0 "Changed default mode to $mode"