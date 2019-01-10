if [[ -z $(grep vimrc-config ~/.vimrc) ]]; then
	echo adding config to .vimrc
	echo "source $(pwd)/vimrc-config" >> ~/.vimrc
fi
