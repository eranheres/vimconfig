if [[ -z $(grep vimrc-config ~/.vimrc) ]]; then
	echo adding config to .vimrc
	echo "source $(pwd)/vimrc-config" >> ~/.vimrc
fi
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
