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
  $ ln -sf [DOTPILE]/misc/ptignore ~/.ptignore
  $ brew install pt
  $ vim +PlugInstall +qall
```

## Setup NeoVim

```
  $ rm -fr ~/.nvim
  $ rm -fr ~/.nvimrc
  $ ln -sf [DOTPILE]/nvim ~/.nvim
  $ ln -sf [DOTPILE]/nvim/nvimrc ~/.nvimrc
  $ ln -sf [DOTPILE]/misc/ptignore ~/.ptignore
  $ brew tap neovim/homebrew-neovim
  $ brew install --HEAD neovim
  $ brew install pt python
  $ pip install neovim
  $ nvim +PlugInstall +qall
```

Update NeoVim:

```
  $ brew update
  $ brew reinstall --HEAD neovim
```

## Setup emacs

```
  $ rm -f ~/.emacs.d /usr/local/bin/emacsl
  $ ln -sf [DOTPILE]/emacs ~/.emacs.d
  $ ln -sf [DOTPILE]/emacs/emacsl.sh /usr/local/bin/emacsl
  $ brew install gnutls pt ispell
  $ ln -sf /usr/local/bin/pt /usr/local/bin/ag
```

## Setup mutt

```
  $ brew install mutt
  $ brew install Gnupg
  $ brew install html2text
  $ ln -sf [DOTPILE]/mutt ~/.mutt
  $ ln -sf [DOTPILE]/mutt/mailcap ~/.mailcap
```

## Setup Chatty (and livestreamer)

```
  $ easy_install -U livestreamer
```

And download Chatty from: http://getchatty.sourceforge.net
