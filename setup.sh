#!/bin/bash

#シンボリックリンク作成
DOT_FILES=( zshrc vimrc vim tmux.conf gvimrc bashrc bash_profile )

for file in ${DOT_FILES[@]}
do
    rm -f $HOME/.$file
    ln -s $HOME/dotfiles/$file $HOME/.$file
done

#git設定
git config --global color.ui "auto"
git config --global user.email $USER@$HOST
git config --global user.name $USER


#NeoBundleのサブモジュール
git submodule init -- vim/bundle/neobundle.vim
git submodule update -- vim/bundle/neobundle.vim
#tmux-powerlineのサブモジュール
git submodule init -- tmux-powerline
git submodule update -- tmux-powerline

# NeoBundleInstall
vim -c NeoBundleInstall -c q
