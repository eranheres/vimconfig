FROM ubuntu:14.04

RUN apt-get update && apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git \
    wget curl

RUN apt remove -y vim vim-runtime gvim && \
    apt remove -y vim-tiny vim-common vim-gui-common vim-nox
#RUN apt-get update && apt-get install -y neovim

#RUN pip install nvim
#RUN pip3 install nvim

#RUN cd ~ && \
    #git clone https://github.com/vim/vim.git && \
    #cd vim  && \
    #./configure --with-features=huge \
            #--enable-multibyte \
            #--with-x \
            #--enable-python3interp=yes \
            #--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
            #--enable-gui=gtk2 \
            #--enable-cscope \
            #--prefix=/usr/local && \
    #make VIMRUNTIMEDIR=/usr/local/share/vim/vim80 && \
    #make install

# setting my personal env setups
#RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
#RUN git clone https://github.com/eranheres/vimconfig.git && \
    #cd vimconfig && \
    #/bin/bash -c 'echo "source $(pwd)/vimrc-config2" >> ~/.vimrc' && \
    #echo | echo | vim +PluginInstall +qall 
#CMD vim
#RUN pip install sagemaker awscli
