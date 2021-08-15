# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi


# Antigen zsh Plugin manager
source ~/Applications/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle aws
antigen bundle catimg
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle command-not-found
antigen bundle copydir
antigen bundle copyfile
antigen bundle docker
antigen bundle docker-compose
antigen bundle extract
antigen bundle git
antigen bundle gradle
antigen bundle maven
antigen bundle node
antigen bundle npm
antigen bundle sdk
antigen bundle sudo
antigen bundle web-search

#antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle MichaelAquilina/zsh-auto-notify
antigen bundle MichaelAquilina/zsh-you-should-use
#antigen bundle marlonrichert/zsh-autocomplete
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# For lf
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"


# Default Apps
export EDITOR="micro"
export READER="zathura"
export VISUAL="micro"
export TERMINAL="urxvt"
export BROWSER="brave"
export VIDEO="mpv"
export IMAGE="sxiv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
export PAGER="less"
export WM="bspwm"


# Env variable
export PATH=~/Applications:/home/anavarro/.cargo/bin:$PATH

#Others
export QT_QPA_PLATFORMTHEME="qt5ct"
# For arduinor
export BOARD_HARDWARE_PATH=~/Arduino/hardware
export ARDUINO_PATH=/usr/local/arduino


# Common alias
alias l='lsd -lFh'     #size,show type,human readable
alias ll='lsd -l'      #long list
alias la='lsd -lAFh'   #long list,show almost all,show type,human readable
alias lt='lsd -ltFh'   #long list,sorted by date,show type,human readable
alias lrt='lsd -1Fcrt'
alias lS='lsd -1FSsh'

alias p='ps -f'
alias h='history'
alias fd='fdfind'
alias grep='grep --color'

alias ..='cd ..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias cdf='cd $(fdfind . --type d ~ | sk)'

alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file

alias e='${EDITOR}'
alias ef='${EDITOR} $(sk --preview "~/.config/lf/preview.sh {}")'
alias o='xdg-open'
alias of='xdg-open $(sk --preview "~/.config/lf/preview.sh {}")'
alias p='${PAGER}'
alias pf='${PAGER} $(sk --preview "~/.config/lf/preview.sh {}")'

alias -s pdf=zathura
alias -s {bmp,jpg,jpeg,png,xmp}=sxiv.sh


	# *.tgz|*.tar.gz) tar tzf "$1";;
	# *.tar.bz2|*.tbz2) tar tjf "$1";;
	# *.tar.txz|*.txz) xz --list "$1";;
	# *.tar) tar tf "$1";;
	# *.zip|*.jar|*.war|*.ear|*.oxt) unzip -l "$1";;
	# *.rar) unrar l "$1";;
	# *.7z) 7z l "$1";;
	# *.[1-8]) man "$1" | col -b ;;
	# *.o) nm "$1" | less ;;
	# *.iso) isoinfo --no-header -l "$1";;
	# *.torrent) transmission-show "$1";;
	# *.iso) iso-info --no-header -l "$1";;
	# *.odt,*.ods,*.odp,*.sxw) odt2txt "$1";;
	# *.doc) catdoc "$1" ;;
	# *.docx) docx2txt "$1" - ;;
	# *.csv) csvlook -e iso-8859-1 "$1";;
# #	*.csv) cat "$1" | sed s/,/\\n/g ;;
# #	*.bmp|*.jpg|*.jpeg|*.png|*.xpm) chafa --fill=block --symbols=block -c 256 -s 92x"${HEIGHT}" "${FILE}" "$1";;
	# *.bmp|*.jpg|*.jpeg|*.png|*.xpm) jp2a "$1";;
# #    *.bmp|*.jpg|*.jpeg|*.png|*.xpm) catimg "$1";;
	# *.avi|*.mp4|*.wmv|*.dat|*.3gp|*.ogv|*.mkv|*.mpg|*.mpeg|*.vob|*.fl[icv]|*.m2v|*.mov|*.webm|*.ts|*.mts|*.m4v|*.r[am]|*.qt|*.divx) mediainfo "$1";;
	# *.pdf) pdftotext "$1" - | less;;
	# *.epub) mediainfo "$1";;
	# *.wav|*.mp3|*.flac|*.m4a|*.wma|*.ape|*.ac3|*.og[agx]|*.spx|*.opus|*.as[fx]|*.flac) exiftool "$1";;
	# 
	# *) highlight --out-format ansi "$1" || batcat "$1";;


# Use lf to switch directories and bind it to ctrl-o
cdlf () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'cdlf\n'
bindkey -s '^f' 'cdf\n'

# Bindkey For Rxvt
bindkey '^[[1;2H^X'  backward-kill-line
bindkey '^[[1;2F^X'  kill-line
bindkey '^[[1;6D^X'  backward-kill-word
bindkey '^[[1;6D^[[1;6D^[[1;6D^[[1;6D^X'  backward-kill-word
bindkey '^[[1;6C^X'  kill-word
bindkey '^[[1;6C^[[1;6C^[[1;6C^[[1;6C^X'  kill-word

# Bindkey For Intellij
bindkey '\eO2H^X' backward-kill-line
bindkey '\eO2F^X' kill-line
bindkey '\eO6D^X' backward-kill-word
bindkey '\eO6D\eO6D\eO6D\eO6D^X' backward-kill-word
bindkey '\eO6C^X' kill-word
bindkey '\eO6C\eO6C\eO6C\eO6C^X' kill-word



# Theme Powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
