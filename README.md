# Vim Setup

Repo walk through good vim configuration and plugins to utilize when
developing Underview software.


**Install Depends**
```sh
$ sudo apt -y install vim
```

**Create bundle + plugin directories**
```sh
$ mkdir -p $HOME/.vim/bundle/Vundle.vim
$ mkdir -p $HOME/.vim/bundle/preservim/nerdtree
$ mkdir -p $HOME/.vim/bundle/airblade/vim-gitgutter
$ mkdir -p $HOME/.vim/bundle/jiangmiao/auto-pairs
```

**Clone important repos**
```sh
$ git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
$ git clone https://github.com/preservim/nerdtree.git $HOME/.vim/bundle/preservim/nerdtree
$ git clone https://github.com/airblade/vim-gitgutter.git $HOME/.vim/bundle/airblade/vim-gitgutter
$ git clone https://github.com/jiangmiao/auto-pairs.git $HOME/.vim/bundle/jiangmiao/auto-pairs
```

**Copy vimrc**
```sh
$ cp -v $(pwd)/vimrc $HOME/.vimrc
```

1. Restart Vim, and run the `:PluginInstall` statement to install plugins.
2. Uncomment commands that are commented out in `vimrc`
