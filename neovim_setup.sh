#!/bin/bash 
if [[ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]]; then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
if [[ ! -f ~/.config/nvim/init.vim ]]; then
	echo "linking init.vim"
	mkdir -p ~/.config/nvim
	ln -sf $PWD/init.vim ~/.config/nvim/init.vim
fi
nvim +PlugInstall +qa 
#nvim +PlugInstall +qa >> /dev/null
cp -R komodo-python ~/.vim
cd ~/.vim/plugged/YouCompleteMe
python install.py
