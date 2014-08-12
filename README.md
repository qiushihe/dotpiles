# dotpiles

### Create Vi Support Directories

```
$ [[ ! -d ~/.vim/backups ]] && mkdir ~/.vim/backups
$ [[ ! -d ~/.vim/swaps ]] && mkdir ~/.vim/swaps
$ [[ ! -d ~/.vim/undo ]] && mkdir ~/.vim/undo
```

### Setup Vi Symlinks

```
$ ln -sf `pwd`/vim/vimrc.bundles ~/.vimrc.bundles
$ ln -sf `pwd`/vim/vimrc ~/.vimrc
$ rm -fr ~/.vim/autoload && ln -sf `pwd`/vim/autoload ~/.vim/autoload
$ rm -fr ~/.vim/bundle && ln -sf `pwd`/vim/bundle ~/.vim/bundle
```

