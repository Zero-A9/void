# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export TERM=xterm-256color

alias ll="ls -l"

#themes
ZSH_THEME="aditya"
plugins=(git)
source $ZSH/oh-my-zsh.sh

#export NNN_COLORS='5'

export NNN_COLORS='6'

export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'

export NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'


#my aliases

alias ll="ls -S -l"

alias c="clear"                                                           
alias a="mpv https://youtu.be/xIAQFHnGeCE"

alias q="exit"

alias app="apt update && apt upgrade -y"       

alias i="apt install"

alias sto="cd /storage/emulated/0"

alias bashrc="vim /data/data/com.termux/files/usr/etc/bash.bashrc"

alias ll.="ls -Sal"

alias cl="du -ha | sort -k1hr | head -n 60"

alias n="nnn -C"

alias rr="rm -rf"

alias v="vim"

alias h="htop"

alias t="termux-wifi-enable true"

alias f="termux-wifi-enable false"

#say hello


#------------------------------------------

# SSH Server Connections

# linux (Arch)
#alias arch='ssh UNAME@IP -i ~/.ssh/id_rsa.DEVICE'

# linux sftp (Arch)
#alias archfs='sftp -i ~/.ssh/id_rsa.DEVICE UNAME@IP'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
