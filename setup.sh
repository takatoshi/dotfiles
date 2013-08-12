#!/bin/bash

#シンボリックリンク作成
DOT_FILES=( zshrc vimrc vim tmux.conf gvimrc bashrc bash_profile )

for file in ${DOT_FILES[@]}
do
    rm -f $HOME/.$file
    ln -s $HOME/dotfiles/$file $HOME/.$file
    source $HOME/.$file
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

# pearを~/libsにインストール
mkdir ~/libs
cd ~/libs
pear  config-create `pwd` .pearrc
pear -c ./.pearrc channel-update pear.php.net
pear -c ./.pearrc install PEAR
pear -c ./.pearrc channel-discover pear.bear-project.net
pear -c ./.pearrc config-set auto_discover 1
pear -c ./.pearrc install -a bear/BEAR-beta

# ctagsインストール
mkdir -p ~/local/src
cd ~/local/src/
wget http://ganmo.excite.co.jp/~mazda/src/ctags-5.8.tar.gz
tar zxvf ctags-5.8.tar.gz
cd ctags-5.8
./configure --prefix=$HOME/local
make && make install

# ackインストール
cd ~/local/bin
wget http://betterthangrep.com/ack-standalone
mv ack-standalone ack
chmod 744 ack

# phpmdインストール
cd ~/libs
pear -c ./.pearrc channel-discover pear.pdepend.org
pear -c ./.pearrc install pdepend/PHP_Depend-beta
pear -c ./.pearrc channel-discover pear.phpmd.org
pear -c ./.pearrc install --alldeps phpmd/PHP_PMD-alpha
sed -i '3s/^/set_include_path(get_include_path().PATH_SEPARATOR.dirname(__FILE__)."\/php");\n/' ~/libs/pear/phpmd

# PHP_CodeSnifferインストール
cd ~/libs
pear -c ./.pearrc install PHP_CodeSniffer
sed -i '18s/^/set_include_path(get_include_path().PATH_SEPARATOR.dirname(__FILE__)."\/php");\n/' ~/libs/pear/phpcs
git clone https://github.com/koriym/BEAR.Saturday.git
rm -rf ~/libs/pear/php/PHP/CodeSniffer/Standards/BEAR
cp -r BEAR.Saturday/data/phpcs/BEAR ~/libs/pear/php/PHP/CodeSniffer/Standards
phpcs --config-set default-standard BEAR
rm -rf BEAR.Saturday
