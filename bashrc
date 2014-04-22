PS1='\[\033[40;1;32m\]\u\[\033[1;32m\]@\[\033[0m\]\[\033[40;1;32m\]\h \[\033[1;36m\]\w \[\033[0m\]\[\033[40;37m\]\d \t\[\033[0m\]\n\\$ '

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function proml {
  PS1="\[\033[40;1;32m\]\u\[\033[1;32m\]@\[\033[0m\]\[\033[40;1;32m\]\h \[\033[1;36m\]\w\$(parse_git_branch) \[\033[0m\]\[\033[40;37m\]\d \t\[\033[0m\]\n\\$ "
}
proml

if [ $(uname) = "Darwin" ]; then
  export EDITOR=/Applicatins/MacVim.app/Contents/MacOS/Vim

  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

  alias ls='ls -Ga'

  alias vm='VBoxManage startvm "Ubuntu 10.04.1" --type headless'
  alias vmq='VBoxManage controlvm "Ubuntu 10.04.1" poweroff'
  alias vmlogin='ssh -l takatoshi 192.168.56.100'
elif [ $(uname) = "Linux" ]; then
  alias ls='ls -a --color=auto'
fi
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias be="vim ~/.bashrc;source ~/.bashrc"
zsh
