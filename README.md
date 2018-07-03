# dotvim
Vim configuration structure

# setup
```
git clone git@github.com:nzimm/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

## Submodules
When the repository is cloned for the first time, the submodules need to be
setup as well. Run 'git submodule init' inside each of the submodule
directories, then 'git submodule update' from the repository root. For example:
```
cd bundle/vim-javascript
git submodule init
cd ../../
git submodule update
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
`execute pathogen#infect()`
