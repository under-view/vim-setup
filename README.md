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
$ mkdir -p $HOME/.vim/bundle/igankevich/mesonic
$ mkdir -p $HOME/.vim/bundle/tikhomirov/vim-glsl
$ mkdir -p $HOME/.vim/pack/colors/start
```

**Clone important repos**
```sh
$ git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
$ git clone https://github.com/preservim/nerdtree.git $HOME/.vim/bundle/preservim/nerdtree
$ git clone https://github.com/airblade/vim-gitgutter.git $HOME/.vim/bundle/airblade/vim-gitgutter
$ git clone https://github.com/jiangmiao/auto-pairs.git $HOME/.vim/bundle/jiangmiao/auto-pairs
$ git clone https://github.com/igankevich/mesonic.git $HOME/.vim/bundle/igankevich/mesonic
$ git clone https://github.com/NLKNguyen/papercolor-theme.git $HOME/.vim/pack/colors/start/papercolor-theme
$ git clone https://github.com/tikhomirov/vim-glsl.git $HOME/.vim/bundle/tikhomirov/vim-glsl
```

**Copy vimrc**
```sh
$ cp -v $(pwd)/vimrc $HOME/.vimrc
```

Restart Vim, and run the `:PluginInstall` statement to install plugins.
