# エイリアス
if [ $(uname) = "Darwin" ]; then
  alias ls='ls -Ga'

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
# キーバインドをemacsに
bindkey -e
# history search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
# auto_cd
setopt auto_cd
# 移動したディレクトリを記憶
setopt auto_pushd
setopt pushd_ignore_dups
# コマンドミスを修正
setopt correct
# 補完候補を詰めて表示
setopt list_packed
# ビープ音を鳴らさない
setopt nolistbeep
# 単語区切り設定
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},.|"
zstyle ':zle:*' word-style unspecified
# 補完候補のカラー表示
zstyle ':completion:*' list-colors ''
# lsと補完候補の色を揃える
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias gls="gls --color"
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
# PATHに追加
# export PATH=/opt/chef/embedded/bin:~/local/bin:~/bin:/usr/local/bin:$PATH
export PATH=~/local/bin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH
# HOSTをシェル内でも使えるように
export HOST
# rbenv設定
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# SVN_EDITOR
export SVN_EDITOR='vim'
# tmuxinator
source ~/.tmuxinator/tmuxinator.zsh
export SHELL='zsh'
export EDITOR='vim'
# JAVA_HOME
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
# maven
export PATH=/usr/share/mvn/bin:$PATH
# hadoop
export PATH=/usr/share/hadoop/bin:$PATH
# mahout
export PATH=/usr/share/mahout/bin:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/tactsh/cocos2d-x/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH
# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Users/tactsh/AndroidDev/android-ndk
export PATH=$NDK_ROOT:$PATH
# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Users/tactsh/AndroidDev/adt-bundle-mac-x86_64-20140702/sdk
export SDK_ROOT=$ANDROID_SDK_ROOT
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/bin
export PATH=$ANT_ROOT:$PATH
export NDK_MODULE_PATH=/Users/tactsh/AndroidDev

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/tactsh/cocos2d-x/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH
