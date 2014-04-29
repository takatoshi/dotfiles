#!/bin/bash

#シンボリックリンク作成
symbolic_link()
{
    DOT_FILES=( zshrc vimrc vim tmux.conf gvimrc bashrc bash_profile ctags zlogout)

    for file in ${DOT_FILES[@]}
    do
        rm -f $HOME/.$file
        ln -s $HOME/dotfiles/$file $HOME/.$file
    done
}

#git設定
init_git()
{
    git config --global color.ui "auto"
    git config --global user.email $USER@$HOST
    git config --global user.name $USER
}

#サブモジュールロード
load_submodule()
{
    cd $HOME/dotfiles
    #NeoBundleのサブモジュール
    git submodule init -- vim/bundle/neobundle.vim
    git submodule update -- vim/bundle/neobundle.vim
    #tmux-powerlineのサブモジュール
    git submodule init -- tmux-powerline
    git submodule update -- tmux-powerline
}

# NeoBundleInstall
neobundle()
{
    vim -c NeoBundleInstall -c q
}

# ctagsインストール
install_ctags()
{
    mkdir -p $HOME/local/bin
    mkdir -p $HOME/local/src

    cd $HOME/local/src/

    wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
    tar zxf ctags-5.8.tar.gz
    cd ctags-5.8
    ./configure --prefix=$HOME/local
    make
    sudo make install
}

main()
{
    symbolic_link
    init_git
    load_submodule
    neobundle
    install_ctags
}

if [ $# -eq 0 ];then
    main
    exit
fi

$1
