#
# ~/.bashrc
#
#set $TERM="st"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1='[\e[30m\u\]@\h \W]\$ '
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#export PS1="\e[90m$(date "+%H:%M:%S") \[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

xinput set-prop 11 286 1

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#alias yolo='x=`tput op` y=`printf %76s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done'
alias yolo='python pipp.py'
alias r='ranger'
alias vim='nvim'
alias screenfetch='~/AUR/env-common/fetch.fish'
alias lcat='lolcat'
alias marco='echo polo'
alias gdb='gdb -q'
# powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh
if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi


alias msfconsole="msfconsole -x \"db_connect ${USER}@msf\""
lcat ~/AUR/ASCII-Art-Splash-Screen/art/7.txt
lcat .yolo
# try loading bash completions
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -r /usr/local/etc/bash_completion.d/git-completion.bash ] && . /usr/local/etc/bash_completion.d/git-completion.bash
[ -r /usr/share/git-core/contrib/completion/git-prompt.sh ] && . /usr/share/git-core/contrib/completion/git-prompt.sh
[ -r /usr/local/etc/bash_completion.d/git-prompt.sh ] && .  /usr/local/etc/bash_completion.d/git-prompt.sh
[ -r /etc/bash_completion.d/git ] && . /etc/bash_completion.d/git
[ -r /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f ~/.ssh/known_hosts ]; then
  complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
fi

shopt -s histappend
export HISTTIMEFORMAT=`echo -e "[\033[90m%Y-%m-%d %T\033[37m]\033[0m "`
export HISTSIZE=2000
export HISTFILESIZE=2000
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM='verbose git'
#http://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt
#export PS1='\e[90m$(date "+%H:%M:%S") \e[0m\u@\h \e[95m\W\e[33;1m$(__git_ps1) \e[0m\$ \[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]'
#export PS1='\e[90m$(date "+%H:%M:%S") \[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]'
export EDITOR="nvim"
#export PATH="$PATH:~/bin"

alias l="ls"
alias ll="ls -lh"
alias lla="ls -lah"
alias rld=". ~/.bashrc"
alias psg="ps -ef | grep -i"
alias hist="history | grep -i"
alias wat="cat"
alias oops='sudo $(history -p \!\!)'
alias acki="ack -i"
alias mcint="mvn clean -DskipTests install"
alias mci="mvn clean install"
alias rgi="rg -i"
alias hr='printf "%*s" "$(tput cols)" | tr " " "-"'
alias here='echo "$(whoami)@$(hostname):$(pwd)"'
alias pullall='find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;'
#sudo wal -R
#(sudo wal -r &)
# Import colorscheme from 'wal' asynchronously
#&   # Run the process in the background.
# ( ) # Hide shell job control messages.
(sudo cat /root/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
sudo cat /root/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

#export PATH="${PATH}:${HOME}/.local/bin/"
#sudo wal -i Pictures/Wallpapers/ratchet.png
#clear
#. "~/.cache/wal/colors.sh"
