#シンボリックリンク作成
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/gvimrc ~/.gvimrc
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/bash_profile ~/.bash_profile
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

#gitのカラー自動設定
git config --global color.ui "auto"

#NeoBundleのサブモジュール
git submodule init -- vim/bundle/neobundle.vim
git submodule update -- vim/bundle/neobundle.vim
#tmux-powerlineのサブモジュール
git submodule init -- tmux-powerline
git submodule update -- tmux-powerline
