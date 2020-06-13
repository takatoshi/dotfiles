#!/bin/bash

#シンボリックリンク作成
symbolic_link()
{
    for f in .??*
    do
        [[ "$f" == ".git" ]] && continue
        [[ "$f" == ".DS_Store" ]] && continue
        rm -rf $HOME/$f
        ln -s $HOME/dotfiles/$f $HOME/$f
    done
}

dein()
{
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.config/dein
}

main()
{
    symbolic_link
}

if [ $# -eq 0 ];then
    main
    dein
    exit
fi

$1
