# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Common alias
alias l='lsd -lFh --group-dirs first'
alias l='lsd -lFh --group-dirs first'
alias ll='lsd -lFh --group-dirs first'
alias la='lsd -lAFh --group-dirs first'
alias lt='lsd -ltFh --group-dirs first'
alias lrt='lsd -lrtFh --group-dirs first'
alias lS='lsd -lSFh --group-dirs first'

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
alias clippaste='xsel -bo'

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
function cdlf () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

function clipcp() {
  #xsel --clipboard --input < "${1:-/dev/stdin}";
  xsel -bi < "${1:-/dev/stdin}";
}

function cpfile {
  emulate -L zsh
  clipcp $1
}

function cppath {
  if [ -n "$1" ]; then
  	realpath $1	| clipcp
  else
  	realpath . | clipcp
  fi
}

# FIXME
function cpbuffer () {
  if which clipcp &>/dev/null; then
    printf "%s" "$BUFFER" | clipcp
  else
    zle -M "clipop not found."
  fi
}

zle -N cpbuffer

bindkey "^O" cpbuffer


#bindkey -s '^V' 'clippaste\n'

# Bindkey for alacritty
# As alactitty eat shift+home / shif+end without any event, just a hack with my programmable keyboard to simulate it with idem potent key tap after.
bindkey '^X ^?'  backward-kill-line
bindkey '^X  ^?^?' kill-line
bindkey '^[[1;5D'  backward-word
bindkey '^[[1;5C'  forward-word
bindkey '^[[1;6D^X'  backward-kill-word
bindkey '^[[1;6D^[[1;6D^[[1;6D^[[1;6D^X'  backward-kill-word
bindkey '^[[1;6C^X'  kill-word

# Bindkey For Rxvt
# bindkey '^[[1;2H^X'  backward-kill-line
# bindkey '^[[1;2F^X'  kill-line
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


# Load prompt with p10k
# Not needed 
# autoload -Uz promptinit && promptinit

# A basic prompt :
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.zsh_history

setopt HIST_FIND_NO_DUPS
# following should be turned off, if sharing history via setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# Load Basic auto/tab completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Enable colors :
autoload -U colors && colors

# Load zmvn to rename file in buk
autoload -U zmv

# Load zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh-history-substring-search
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
bindkey '^[[1;5A' history-substring-search-up
bindkey '^[[1;5B' history-substring-search-down

# Load zsh-completions
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh

# Load zsh-auto-notify
source ~/.zsh/zsh-auto-notify/auto-notify.plugin.zsh

# Load zsh-you-should-use
source ~/.zsh/zsh-you-should-use/you-should-use.plugin.zsh

# Load zsh-interactive-cd
#source ~/.zsh/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

# Load zsh-autocomplete
#source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Color mam pages
 export LESS_TERMCAP_mb=$'\e[1;32m'
 export LESS_TERMCAP_md=$'\e[1;36m'
 export LESS_TERMCAP_me=$'\e[0m'
 export LESS_TERMCAP_se=$'\e[0m'
 export LESS_TERMCAP_so=$'\e[01;33m'
 export LESS_TERMCAP_ue=$'\e[0m'
 export LESS_TERMCAP_us=$'\e[1;4;36m'
 

# Prompt : Powerlevel10k
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

