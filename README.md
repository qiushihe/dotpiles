# dotpiles

## Setup Bash

**Linking bash_profile**:

    $ rm -f ~/.bash_profile && ln -sf `pwd`/misc/bash_profile ~/.bash_profile

## Setup VI

**Install Ack**:

    $ brew install ack

**Ensure support directories exists**:

    $ [[ ! -d ~/.vim/backups ]] && mkdir ~/.vim/backups
    $ [[ ! -d ~/.vim/swaps ]] && mkdir ~/.vim/swaps
    $ [[ ! -d ~/.vim/undo ]] && mkdir ~/.vim/undo

**Setup symlinks**:

    $ ln -sf `pwd`/vim/vimrc.bundles ~/.vimrc.bundles
    $ ln -sf `pwd`/vim/vimrc ~/.vimrc
    $ rm -fr ~/.vim/autoload && ln -sf `pwd`/vim/autoload ~/.vim/autoload
    $ rm -fr ~/.vim/bundle && ln -sf `pwd`/vim/bundle ~/.vim/bundle

## Setup Git

    $ rm -f ~/.gitconfig && ln -sf `pwd`/misc/gitconfig ~/.gitconfig
    $ rm -f ~/.gitignore_global && ln -sf `pwd`/misc/gitignore_global ~/.gitignore_global

## Setup Emacs

**Install ag**

    $ brew install the_silver_searcher

**Setup symlinks**:

    $ ln -sf `pwd`/emacs ~/.emacs.d
    $ ln -sf `pwd`/emacs/gemacs.sh /usr/local/bin/gemacs

_Upon first launch of Emacs, el-get will install itself and all previous installed pcakges._
