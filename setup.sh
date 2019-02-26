#!/bin/sh 
if [[ -z $(grep vimrc-config ~/.vimrc) ]]; then
	echo adding config to .vimrc
	echo "source $(pwd)/vimrc-config" >> ~/.vimrc
fi
vim +PluginInstall +qa
cp -R komodo-python ~/.vim
cd ~/.vim/bundle/YouCompleteMe
python install.py
