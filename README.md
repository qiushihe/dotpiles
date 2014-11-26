# dotpiles

## Install Ack

    $ brew install ack

## Setup VI

**Ensure support directories exists**:

    $ [[ ! -d ~/.vim/backups ]] && mkdir ~/.vim/backups
    $ [[ ! -d ~/.vim/swaps ]] && mkdir ~/.vim/swaps
    $ [[ ! -d ~/.vim/undo ]] && mkdir ~/.vim/undo

**Setup symlinks**:

    $ ln -sf `pwd`/vim/vimrc.bundles ~/.vimrc.bundles
    $ ln -sf `pwd`/vim/vimrc ~/.vimrc
    $ rm -fr ~/.vim/autoload && ln -sf `pwd`/vim/autoload ~/.vim/autoload
    $ rm -fr ~/.vim/bundle && ln -sf `pwd`/vim/bundle ~/.vim/bundle

## Setup Emacs

**Setup symlinks**:

    $ ln -sf `pwd`/emacs ~/.emacs.d
    $ ln -sf `pwd`/emacs/gemacs.sh /usr/local/bin/gemacs
