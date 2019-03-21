#!/bin/sh 
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [[ ! -d $HOME/.config/nvim/init.vim ]]; then
	mkdir -p $HOME/.config/nvim
	ln -sf $pwd/init.vim $HOME/.config/nvim/init.vim
fi
#nvim +PluginInstall +qa
#cp -R komodo-python ~/.vim
#cd ~/.vim/bundle/YouCompleteMe
#python install.py
