#!/bin/bash

RELPATH=`dirname "${BASH_SOURCE[0]}"`
DOTPILE=`cd "$_RELPATH" && pwd`

if [ "$1" == "bash" ]; then
  rm -f ~/.bash_profile
	ln -sf $DOTPILE/misc/bash_profile ~/.bash_profile
elif [ "$1" == "git" ]; then
	rm -f ~/.gitconfig ~/.gitignore_global
	ln -sf $DOTPILE/misc/gitconfig ~/.gitconfig
	ln -sf $DOTPILE/misc/gitignore_global ~/.gitignore_global
elif [ "$1" == "vim" ]; then
	rm -fr ~/.vim
	rm -fr ~/.vimrc
	ln -sf $DOTPILE/vim ~/.vim
	ln -sf $DOTPILE/vim/vimrc ~/.vimrc
  brew install the_silver_searcher
	brew install cmake
	vim +PluginInstall +qall
  $DOTPILE/vim/vundle/YouCompleteMe/install.sh --clang-completer
  echo "Besure to install fonts for airline from: https://github.com/powerline/fonts"
elif [ "$1" == "emacs" ]; then
	rm -f ~/.emacs.d /usr/local/bin/gemacs
	ln -sf $DOTPILE/emacs ~/.emacs.d
	ln -sf $DOTPILE/emacs/gemacs.sh /usr/local/bin/gemacs
	brew install the_silver_searcher
	brew install ispell
else
  echo "Setup dotpiles components:"
  echo "  $ setup.sh [bash|git|vim|emacs]"
fi

