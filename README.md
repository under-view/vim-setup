# Vim Setup

Repo walk through good vim configuration and plugins to utilize when
developing Underview software.


**Create bundle + plugin directories**
```sh
$ mkdir -p $HOME/.vim/bundle/Vundle.vim
$ mkdir -p $HOME/.vim/bundle/preservim/nerdtree
```

**Clone important repos**
```sh
$ git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
$ git clone https://github.com/preservim/nerdtree.git $HOME/.vim/bundle/preservim/nerdtree
```

**Copy vimrc**
```sh
$ cp -v $(pwd)/vimrc $HOME/.vimrc
```

1. Restart Vim, and run the `:PlugInstall` statement to install plugins.
2. Uncomment commands that are commented out in `vimrc`
