# dotvim
Vim configuration structure

# setup
```
git clone git@github.com:nzimm/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

# plugins
I use the plugin manager [vim-plug](https://github.com/junegunn/vim-plug), which
makes adding new plugins simple. When adding a new plugin, add a line to the
`.vim/plugins.vim` file to tell vim-plug where to find it, and then run the
command `:PlugUpdate` to download it.
