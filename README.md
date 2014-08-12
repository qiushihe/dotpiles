# dotpiles

### Create Vi Support Directories

```
$ [[ ! -d ~/.vim/backups ]] && mkdir ~/.vim/backups
$ [[ ! -d ~/.vim/swaps ]] && mkdir ~/.vim/swaps
$ [[ ! -d ~/.vim/undo ]] && mkdir ~/.vim/undo
```

### Setup `.vimrc` Symlinks

```
$ ln -sf ./vim/vimrc.bundles ~/.vimrc.bundles
$ ln -sf ./vim/vimrc ~/.vimrc
```

