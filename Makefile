dotpiles_root := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

dotpiles:
	@echo "To setup individual components, run:"
	@echo "  make [COMPONENT]"
	@echo "\nAvailable components are:"
	@echo "  * bash"
	@echo "  * git"
	@echo "  * emacs"
	@echo "  * vim"

bash:
	rm -f ~/.bash_profile
	ln -sf $(dotpiles_root)/misc/bash_profile ~/.bash_profile

git:
	rm -f ~/.gitconfig ~/.gitignore_global
	ln -sf $(dotpiles_root)/misc/gitconfig ~/.gitconfig
	ln -sf $(dotpiles_root)/misc/gitignore_global ~/.gitignore_global

emacs:
	brew install the_silver_searcher
	brew install ispell
	rm -f ~/.emacs.d /usr/local/bin/gemacs
	ln -sf `pwd`/emacs ~/.emacs.d
	ln -sf `pwd`/emacs/gemacs.sh /usr/local/bin/gemacs

vim:
	brew install ack
	rm -f ~/.vim ~/.vimrc ~/.vimrc.bundles
	mkdir ~/.vim ~/.vim/backups ~/.vim/swaps ~/.vim/undo
	ln -sf $(dotpiles_root)/vim/vimrc.bundles ~/.vimrc.bundles
	ln -sf $(dotpiles_root)/vim/vimrc ~/.vimrc
	ln -sf $(dotpiles_root)/vim/autoload ~/.vim/autoload
	ln -sf $(dotpiles_root)/vim/bundle ~/.vim/bundle
