# エイリアス
if [ $(uname) = "Darwin" ]; then
  alias ls='ls -Ga'

  alias vm='VBoxManage startvm "Ubuntu 10.04.1" --type headless'
  alias vmq='VBoxManage controlvm "Ubuntu 10.04.1" poweroff'
  alias vmlogin='ssh -l takatoshi 192.168.56.100'

  # 言語
  export LANG=ja_JP.UTF-8

elif [ $(uname) = "Linux" ]; then
  alias ls='ls -a --color=auto'
fi
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias be="vim ~/.zshrc;source ~/.zshrc"
alias where="command -v"
alias j="jobs -l"
alias lf="ls -F"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias su="su -l"

# 補完機能
autoload -U compinit
compinit
# プロンプト
case ${UID} in
0)
    PROMPT="%B%{[31m%}%/#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%F{green}%n@%m%f %F{cyan}%~%f %F{white}%D{%m/%d %T}
%(!.#.$)%f "
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac
# タイトル
case "${TERM}" in
kterm*|xterm*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}\007"
    }
    ;;
esac
# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
# history search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
# キーバインドをemacsに
# bindkey -e
# auto_cd
setopt auto_cd
# 移動したディレクトリを記憶
setopt auto_pushd
# コマンドミスを修正
setopt correct
# 補完候補を詰めて表示
setopt list_packed
# ビープ音を鳴らさない
setopt nolistbeep
# 先方予測機能有効
# autoload predict-on
# predict-on
# 補完候補のカラー表示
zstyle ':completion:*' list-colors ''
# lsと補完候補の色を揃える
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias gls="gls --color"
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
# PATHに追加
export PATH=~/local/bin:~/libs/pear:~/bin:$PATH
# HOSTをシェル内でも使えるように
export HOST
