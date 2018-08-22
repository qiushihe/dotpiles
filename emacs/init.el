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

;; Enable normalized indentation mode
(normalize-indent-global-mode)

;; Open the quick-help file in a separate, small frame
(bind-key* "C-c q h" (lambda ()
  (interactive)
  (let (
    (help-frame (make-frame '((width . 42) (height . 35))))
  ) (progn
    (select-frame help-frame)
    (find-file "~/.emacs.d/quick-help.txt")

    ;; Setup a local key bind to close the frame and delete the buffer
    (local-set-key "q" (lambda ()
      (interactive)
      (my-kill-some-buffers)
      (delete-frame)
    ))

    ;(other-frame -1) ; Refocus the previous frame
  ))
))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:ask-p nil)
 '(git-gutter:hide-gutter t)
 '(git-gutter:verbosity 0)
 '(linum-format (quote dynamic))
 '(package-selected-packages
   (quote
    (monokai-theme web-mode stylus-mode magit avy expand-region company git-gutter helm-projectile helm-ag helm editorconfig exec-path-from-shell use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
