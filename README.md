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
I use the plugin manager [vim-plug](https://github.com/junegunn/vim-plug), which
should be dynamically 
all my plugins are stored under `~/.vim/plugged/`. 
