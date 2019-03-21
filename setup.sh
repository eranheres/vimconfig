#!/bin/sh 
if [[ ! -f $(grep vimrc-config ~/.vimrc) ]]; then
	ln -sf $(PWD)/init.vim $(HOME)/.config/nvim/init.vim
fi
if [[ ! -d "~/.vim/bundle/Vundle.vim" ]]; then 
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qa
cp -R komodo-python ~/.vim
cd ~/.vim/bundle/YouCompleteMe
python install.py
