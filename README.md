# dotvim
Vim configuration structure

# setup
```
git clone git@github.com:nzimm/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

# Dependencies
I use [pathogen](https://github.com/tpope/vim-pathogen) to enable syntax
highlighting. The following quick-and-dirty install works, but any additional
plugins must be manually installed.
```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```
Now enable pathogen, by adding this line to ~/.vimrc
```execute pathogen#infect()```
Run the following two commands to update submodules for pathogen
```
git submodule init
git submodule update
```
