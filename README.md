## 1. install vim

```shell
./configure --with-features=huge \
    --enable-multibyte \
    --enable-pythoninterp=yes \
    --enable-python3interp=yes \
    --enable-gui=gtk2 \
    --enable-cscope \
    --enable-fontset \
    --enable-perlinterp \
    --enable-rubyinterp \
    --disable-netbeans \
    --enable-fail-if-missing \
    --prefix=/usr/local/vim
```

## 2. install ycm

```shell
cp -r vim.vimrc ~/.vimrc
cp -r ycm_extra_conf.py ~/.ycm_extra_conf.py
```

```shell
cd ~/.vim/bundle/
git clone git@github.com:ycm-core/YouCompleteMe.git
git submodule update --init --recursive
python3 install.py --go-completer --clang-completer --all
```

## 3. install plugins

```vim
:PluginInstall
:GoInstallBinaries
```

## 4. use vim
