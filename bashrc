PS1='\[\033[40;1;32m\]\u\[\033[1;32m\]@\[\033[0m\]\[\033[40;1;32m\]\h \[\033[1;36m\]\w \[\033[0m\]\[\033[40;37m\]\d \t\[\033[0m\]\n\\$ '

export EDITOR=/Applicatins/MacVim.app/Contents/MacOS/Vim

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias ls='ls -Ga'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias vm='VBoxManage startvm "CentOS_5_7" --type headless'
alias vmq='VBoxManage controlvm "CentOS_5_7" poweroff'
alias vmlogin='sudo ssh -l admin 192.168.56.101'
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g --remote-tab-silent'