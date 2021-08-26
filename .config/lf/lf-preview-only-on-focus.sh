#!/bin/bash

bspc subscribe node_focus | while read line
do
	isLfFocused=$(xprop -id $(echo "$line" | awk '{print $4}') | grep '^WM_CLASS(STRING) = "lf"' | wc -l)
	if [ "$isLfFocused" = "0" ]; then
	    ~/bin/lf -remote 'send set nopreview' && ~/bin/lf -remote 'send set ratios 1:2'
	else
	    ~/bin/lf -remote 'send set preview' && ~/bin/lf -remote 'send set ratios 1:2:3'
	fi
done
