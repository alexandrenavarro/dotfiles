#!/bin/sh
# Preview script built for use with lf
LINES=30
case "$1" in
	*.tgz|*.tar.gz) tar tzf "$1";;
	*.tar.bz2|*.tbz2) tar tjf "$1";;
	*.tar.txz|*.txz) xz --list "$1";;
	*.tar) tar tf "$1";;
	*.zip|*.jar|*.war|*.ear|*.oxt) unzip -l "$1";;
	*.rar) unrar l "$1";;
	*.7z) 7z l "$1";;
	*.[1-8]) man "$1" | col -b ;;
	*.o) nm "$1" | less ;;
	*.iso) isoinfo --no-header -l "$1";;
	*.torrent) transmission-show "$1";;
	*.iso) iso-info --no-header -l "$1";;
	*.odt,*.ods,*.odp,*.sxw) odt2txt "$1";;
	*.doc) catdoc "$1" ;;
	*.docx) docx2txt "$1" - ;;
	*.csv) csvlook -e iso-8859-1 "$1";;
#	*.csv) cat "$1" | sed s/,/\\n/g ;;
#	*.bmp|*.jpg|*.jpeg|*.png|*.xpm) chafa --fill=block --symbols=block -c 256 -s 92x"${HEIGHT}" "${FILE}" "$1";;
	#*.bmp|*.jpg|*.jpeg|*.png|*.xpm) jp2a --colors --color-depth=8 "$1";;
#	*.bmp|*.jpg|*.jpeg|*.png|*.xpm) /home/anavarro/idea-projects/java-terminal-sample/target/java-terminal-sample `echo "$(tput cols)/2-3"|bc` `echo "$(tput lines)-4"|bc` "$1";;
#    *.bmp|*.jpg|*.jpeg|*.png|*.xpm) catimg  "$1";;
#    *.bmp|*.jpg|*.jpeg|*.png|*.xpm) kitty +kitten icat "$1";;
    *.bmp|*.jpg|*.jpeg|*.JPG|*.JPEG|*.png|*.xpm) width=`echo "$(tput cols)/2-3"|bc`;height=`echo "$(tput lines)-4"|bc`; chafa -s $(echo "${width}x${height}") "$1";;
	*.avi|*.mp4|*.wmv|*.dat|*.3gp|*.ogv|*.mkv|*.mpg|*.mpeg|*.vob|*.fl[icv]|*.m2v|*.mov|*.webm|*.ts|*.mts|*.m4v|*.r[am]|*.qt|*.divx) mediainfo "$1";;
	*.pdf) pdftotext "$1" - | less;;
	*.epub) mediainfo "$1";;
	*.wav|*.mp3|*.flac|*.m4a|*.wma|*.ape|*.ac3|*.og[agx]|*.spx|*.opus|*.as[fx]|*.flac) exiftool "$1";;
	
	*) highlight --out-format ansi "$1" || batcat "$1";;
esac
