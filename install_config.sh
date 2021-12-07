#!/bin/bash
ln -fs $(pwd)/.vimrc ~/.vimrc
ln -fs $(pwd)/.ideavimrc ~/.ideavimrc
ln -fs $(pwd)/.tmux.conf ~/.tmux.conf
ln -fs $(pwd)/.bashrc ~/.bashrc

if [[ ! -e ~/.bash_profile ]]; then
    touch ~/.bash_profile
fi

echo "source ~/.bashrc" >> ~/.bash_profile
# Python
# ln -fs $(pwd)/flake8 ~/.config/flake8
