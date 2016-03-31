(add-to-list 'load-path "~/.emacs.d/user-packages")

(load-library "ensure-use-package")
(load-library "default-settings")
(load-library "default-bindings")
(load-library "kill-some-buffers")               ; Provides C-c b d
(load-library "line-number")
(load-library "matching-parenthesis")            ; Provides C-c [
(load-library "esc-no-close-split")
(load-library "smarter-move-beginning-of-line")
(load-library "switch-to-previous-buffer")       ; Provides C-c b b
(load-library "normalize-indent")                ; Provides normalize-indent-global-mode

(normalize-indent-global-mode)
