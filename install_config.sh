#!/bin/bash
ln -fs $(pwd)/.ideavimrc ~/.ideavimrc
ln -fs $(pwd)/.tmux.conf ~/.tmux.conf
ln -fs $(pwd)/.bashrc ~/.bashrc
ln -fs $(pwd)/.aliasrc ~/.aliasrc
ln -fs $(pwd)/karabiner.json ~/.config/karabiner/karabiner.json
mkdir -p ~/.config/nvim/lua
ln -fs $(pwd)/nvim/init.lua ~/.config/nvim/init.lua
ln -fs $(pwd)/nvim/lua/plugins ~/.config/nvim/lua/plugins
