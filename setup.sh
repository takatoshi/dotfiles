#!/bin/sh

source ~/.zshrc

#シンボリックリンク作成
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/gvimrc ~/.gvimrc
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/bash_profile ~/.bash_profile
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

# なぜか生成されてしまうファイル削除
rm -f ~/dotfiles/vim/vim

#git設定
git config --global color.ui "auto"
git config --global core.pager ''
git config --global user.email $USER@$HOST
git config --global user.name $USER


#NeoBundleのサブモジュール
git submodule init -- vim/bundle/neobundle.vim
git submodule update -- vim/bundle/neobundle.vim
#tmux-powerlineのサブモジュール
git submodule init -- tmux-powerline
git submodule update -- tmux-powerline

