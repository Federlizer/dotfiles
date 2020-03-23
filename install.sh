#!/bin/sh

mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/kitty
cp ./kitty.conf ~/.config/kitty/kitty.conf

cp ./tmux.conf ~/.tmux.conf
cp ./bashrc ~/.bashrc

echo 'Done.'
