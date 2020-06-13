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
alias ...="../../"
alias ....="../../../"
alias .....="../../../../"
alias bundletool="java -jar ~/AndroidStudioProjects/bundletool-all-0.11.0.jar"

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
export PATH=~/local/bin:~/bin:/usr/local/bin:/usr/local/sbin:$PATH
# HOSTをシェル内でも使えるように
export HOST
# rbenv設定
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# SVN_EDITOR
export SVN_EDITOR='vim'
export SHELL='zsh'
export EDITOR='vim'
# JAVA_HOME
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
# maven
export PATH=/usr/share/mvn/bin:$PATH

# Add environment variable ANDROID_SDK_ROOT
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ANDROID_SDK_ROOT/tools/lib64

# rbenv
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
