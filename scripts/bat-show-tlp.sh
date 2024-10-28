#!/bin/sh
file="/etc/tlp.d/01-default-mode.conf"

# TLP mod
if cat $file | grep -q BAT;
then
	mode="BAT"
else
	mode="AC"
fi

hyprctl notify -0 2000 0 "Default mode: $mode"