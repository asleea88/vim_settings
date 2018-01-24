### Create symbolic link
```
$ ln -sf ./.vimrc ~/.vimrc
$ ln -sf ./.tmux_conf ~/.tmux.conf
$ ln -sf ./.flake8 ~/.config/flake8
```

### Install Vundel
```
$ ./installVundle.sh
```


### Install YouCompeteMe
```
$ sudo apt-get install build-essential cmake
$ cd ~/.vim/bundle/YouCompleteMe
$ ./install.py --clang-completer
```

### Install flake8

Install `flake8` for both python2 and 3.

```
$ pip3 install flake8
$ cd /usr/local/bin
$ mv flake8 flake8-py3
$ pip install flake8
```


