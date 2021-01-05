#!/bin/bash

bspc subscribe node_focus | while read line
do
	isLfFocused=$(xprop -id $(echo "$line" | awk '{print $4}') | grep 'WM_NAME(STRING) = "lf"' | wc -l)
	if [ "$isLfFocused" == "0" ]; then
	    ~/Applications/lf -remote 'send set nopreview' && ~/Applications/lf -remote 'send set ratios 1:2'
	else
	    ~/Applications/lf -remote 'send set preview' && ~/Applications/lf -remote 'send set ratios 1:2:3'
	fi
done
