#シンボリックリンク作成
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/gvimrc ~/.gvimrc
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/bash_profile ~/.bash_profile
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

#gitのカラー自動設定
git config --global color.ui "auto"

#NeoBundleのサブモジュール
git submodule init -- vim/bundle/neobundle.vim
git submodule update -- vim/bundle/neobundle.vim
#tmux-powerlineのサブモジュール
git submodule init -- tmux-powerline
git submodule update -- tmux-powerline
