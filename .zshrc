# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi


# Antigen zsh Plugin manager
source ~/bin/antigen.zsh

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
antigen bundle marlonrichert/zsh-autocomplete
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme.
antigen theme romkatv/powerlevel10k
#antigen theme spaceship-prompt/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

# Common alias
alias l='lsd -lFh'
alias l='lsd -lFh'
alias ll='lsd -lFh'
alias la='lsd -lAFh'
alias lt='lsd -ltFh'
alias lrt='lsd -lrtFh'
alias lS='lsd -lSFh'

alias p='ps -f'
alias h='history'
alias fd='fdfind'
alias grep='grep --color'

alias ..='cd ..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias cdf='cd $(fdfind . --type d ~ | sk)'
alias md='mkdir -p'

alias mi='micro'
alias mif='micro $(sk --preview "~/.config/lf/preview.sh {}")'
alias e='micro'
alias ef='micro $(sk --preview "~/.config/lf/preview.sh {}")'
alias o='xdg-open'
alias of='xdg-open $(sk --preview "~/.config/lf/preview.sh {}")'
alias p='less'
alias pf='less $(sk --preview "~/.config/lf/preview.sh {}")'

# App by default by extention
alias -s {txt,xml,md,java,make,gradle,js,ts}=micro
alias -s {bmp,jpg,jpeg,png,xmp}=sxiv.sh
alias -s {pdf,epub}=zathura
alias -s {zip,tar,gz,tbz2,jar,war,ear,oxt,7z,rar,iso}=fileroller
alias -s {avi,mp4,wmv,dat,3gp,ogv,mkv,mpg,mpeg,vob,.m2v,mov,webm,mts,m4v,rm,qt,divx}=mpv
alias -s {wav,mp3,flac,m4a,wma,ape,ac3,ogg,spx,opus,asf}=mpv
alias -s {zip,tar,gz,tbz2,jar,war,ear,oxt,7z,rar,iso}=engramma
alias -s {odt,ods,odp,sxw,doc,docx}=libreoffice --writer
alias -s {csv}=libreoffice --calc


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

#bindkey -s '^o' 'cdlf\n'
#bindkey -s '^f' 'cdf\n'

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
