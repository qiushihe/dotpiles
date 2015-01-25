# dotpiles

## Setup bash profile

```
  $ rm -f ~/.bash_profile
  $ ln -sf [DOTPILE]/misc/bash_profile ~/.bash_profile
```

## Setup git

```
  $ rm -f ~/.gitconfig ~/.gitignore_global
  $ ln -sf [DOTPILE]/misc/gitconfig ~/.gitconfig
  $ ln -sf [DOTPILE]/misc/gitignore_global ~/.gitignore_global
```

## Setup vim

```
  $ rm -fr ~/.vim
  $ rm -fr ~/.vimrc
  $ ln -sf [DOTPILE]/vim ~/.vim
  $ ln -sf [DOTPILE]/vim/vimrc ~/.vimrc
  $ brew install the_silver_searcher
  $ vim +PluginInstall +qall
```

Also install patched powerline font in `vim` directory.

## Setup emacs

```
  $ rm -f ~/.emacs.d /usr/local/bin/gemacs
  $ ln -sf [DOTPILE]/emacs ~/.emacs.d
  $ ln -sf [DOTPILE]/emacs/gemacs.sh /usr/local/bin/gemacs
  $ brew install the_silver_searcher
  $ brew install ispell
```

