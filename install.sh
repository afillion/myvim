#!/bin/bash

# get the config dir
DIR=`pwd`

# create the symbolic links
ln -s $DIR $HOME/.vim
ln -s $DIR/vimrc $HOME/.vimrc

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install plugins
vim +PluginInstall +qall

# create tmp dir
mkdir $DIR/tmp
