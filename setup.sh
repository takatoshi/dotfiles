#!/bin/bash

install_vim()
{
    # vimインストール
    mkdir -p $HOME/local/src
    cd $HOME/local/src/
    wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
    tar jxf vim-7.4.tar.bz2
    cd vim74
    ./configure --enable-multibyte \
                --with-features=huge \
                --disable-gui \
                --without-x \
                --prefix=$HOME/local \
                --enable-rubyinterp \
                --enable-pythoninterp \
                --enable-perlinterp \
                --enable-cscope \
                --with-tlib=ncurses
    make && make install
    cd $HOME/
}

#シンボリックリンク作成
symbolic_link()
{
    DOT_FILES=( zshrc vimrc vim tmux.conf gvimrc bashrc bash_profile ctags)

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

# pearインストール
install_pear()
{
    mkdir -p $HOME/libs
    cd $HOME/libs
    pear  config-create `pwd` .pearrc
    pear -c ./.pearrc config-set auto_discover 1
    pear -c ./.pearrc config-set preferred_state alpha
    pear -c ./.pearrc channel-update pear.php.net
    pear -c ./.pearrc install PEAR
    pear -c ./.pearrc upgrade pear/PEAR
    pear -c ./.pearrc upgrade-all
    # bearインストール
    # pear -c ./.pearrc channel-discover pear.bear-project.net
    # pear -c ./.pearrc install -a bear/BEAR-beta
}

# ctagsインストール
install_ctags()
{
    mkdir -p $HOME/local/src/
    cd $HOME/local/src/
    wget http://ganmo.excite.co.jp/~mazda/src/ctags-5.8.tar.gz
    tar zxvf ctags-5.8.tar.gz
    cd ctags-5.8
    ./configure --prefix=$HOME/local
    make && make install
}

# ackインストール
install_ack()
{
    mkdir -p $HOME/local/bin
    cd $HOME/local/bin
    wget http://betterthangrep.com/ack-standalone
    mv ack-standalone ack
    chmod 744 ack
}

# phpmdインストール
install_phpmd()
{
    mkdir -p $HOME/libs
    cd $HOME/libs
    pear -c ./.pearrc channel-discover pear.pdepend.org
    pear -c ./.pearrc install pdepend/PHP_Depend-beta
    pear -c ./.pearrc channel-discover pear.phpmd.org
    pear -c ./.pearrc install --alldeps phpmd/PHP_PMD-alpha
    sed -i '3s/^/set_include_path(get_include_path().PATH_SEPARATOR.dirname(__FILE__)."\/php");\n/' $HOME/libs/pear/phpmd
}

# PHP_CodeSnifferインストール
install_phpcs()
{
    mkdir -p $HOME/libs
    cd $HOME/libs
    pear -c ./.pearrc install PHP_CodeSniffer
    sed -i '18s/^/set_include_path(get_include_path().PATH_SEPARATOR.dirname(__FILE__)."\/php");\n/' $HOME/libs/pear/phpcs
    git clone https://github.com/koriym/BEAR.Saturday.git
    rm -rf $HOME/libs/pear/php/PHP/CodeSniffer/Standards/BEAR
    cp -r BEAR.Saturday/data/phpcs/BEAR $HOME/libs/pear/php/PHP/CodeSniffer/Standards
    $HOME/libs/pear/phpcs --config-set default-standard BEAR
    rm -rf BEAR.Saturday
}

main()
{
    install_vim
    symbolic_link
    init_git
    load_submodule
    neobundle
    install_pear
    install_ctags
    install_ack
    install_phpmd
    install_phpcs
}

if [ $# -eq 0 ];then
    main
    exit
fi

$1
