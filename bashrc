if [ -z "$PS1" ]; then
   return
fi

alias .='ffuf -v -c -r -fc 500,403 -request req -w'

clear
cd $HOME/wordlists

bind 'set colored-stats on'
bind 'set colored-completion-prefix on'
bind 'set show-all-if-ambiguous on'
bind 'TAB: menu-complete'
bind '"\e[Z": menu-complete-backward'
bind 'set page-completions on'

shopt -s autocd

alias h='$HOME/wordlists'
alias urls='gau $URL --o urls --verbose'
alias cd='HOME=~/wordlists cd'
alias cat='pygmentize -g'
alias rm='rm -rf'
alias ..='cd ..'
alias ls='exa -F'
alias la='exa -aF'
alias l='exa -l --sort=size'
alias r='exa -R -S'
alias find='fzf -e'
alias rc='nano $HOME/.bashrc'
alias ,,='nano'
alias ,='pygmentize -g'
alias route='readlink -f'
alias i='ifconfig | rg -e "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"'
alias ifconfig='ifconfig | rg -e "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"'
alias ip='ifconfig | rg -e "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"'
alias md='mdless'
alias nsub='nmap --script dns-brute --script-args dns-brute.domain=$URL,dns-brute.threads=6 -vv -oN scan'
alias nall='nmap -F -iL scan --open -oN nall'
alias nu='nmap -F $URL -v'
alias sub='subfinder -d $URL -o scan'
alias URL='export URL'
#alias addk='echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6'
alias k='apt-get -y update && apt-get -y -f upgrade && apt-get -y -f full-upgrade'
alias http=',, $HOME/wordlists/http-status-codes/README.md'
alias t='tree -L 1 -C -h -i --sort=size -r'
alias tr='tree -L 2 -C -h --sort=size -r'
alias n='nmap -F -v'
alias u='echo $URL'
alias dec64='echo $DEC | base64 -d'
alias i='apt-get -y install'
alias install='apt-get -y install'
alias b='bash'
alias f='neofetch'
alias e='exit'
alias g='git clone'
alias dr='ssh root@159.223.206.182'
alias lg='ls -GF | rg'
alias d='dog A AAAA CNAME MX NS PTR SOA $URL'
alias ar='apt-get autoremove -y'
alias p='pwd'
alias ni='npm install -g'
alias cu='curlie -s $URL'
alias cupr='curl -x "127.0.0.1:8080" $URL'
alias ww='whatweb $URL'
alias w='whoami'
alias gi='go install'
alias nf='npm fund'
alias bash='sudo bash'
alias push='git add --all; git status; git commit -m "update"; git push;'
alias pull='git pull'
alias hak='echo https://$URL | hakrawler'
alias nab='naabu $URL'
alias urc='cp $HOME/.bashrc $HOME/bashrc/bashrc; cd $HOME/bashrc; push'
alias repos='git clone https://github.com/Luisda2705/bashrc.git && git clone https://github.com/Luisda2705/Tools.git && git clone https://github.com/Luisda2705/Misc.git'
alias rmrepos='rm bashrc/ && rm Tools/ && rm Misc/'


export PATH="~/go/bin/:$PATH"
export PATH=/opt/homebrew/bin:$PATH

function decu() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }

command_not_found_handle () {
       printf "";
	clear
       return 127
}


function x {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

PS1='\$ '

# Make bash check its window size after a process completes
shopt -s checkwinsize
[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"

LS_COLORS="$LS_COLORS:di=01;34"

eval export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew";
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar";
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew";
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
