;; Unbind some OSX-specific bindings
(global-unset-key (kbd "s-s"))
(global-unset-key (kbd "s-a"))
(global-unset-key (kbd "s-z"))
(global-unset-key (kbd "s-Z"))
(global-unset-key (kbd "s-c"))
(global-unset-key (kbd "s-x"))
(global-unset-key (kbd "s-v"))

;; Rebind kill-this-buffer
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

;; Resize window
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Keyboard scrolling speed
(setq scroll-step 10)
(setq hscroll-step 10)

;; Mouse scrolling settings
(setq mouse-autoselect-window t)
(setq mouse-wheel-follow-mouse 't)

;; Mouse wheel binding
(defun my-scroll-up-single () (interactive) (scroll-down-1 2))
(defun my-scroll-up-double () (interactive) (scroll-down-1 6))
(defun my-scroll-up-triple () (interactive) (scroll-down-1 12))
(defun my-scroll-down-single () (interactive) (scroll-up-1 2))
(defun my-scroll-down-double () (interactive) (scroll-up-1 6))
(defun my-scroll-down-triple () (interactive) (scroll-up-1 12))
(defun my-scroll-left-single () (interactive) (scroll-right-1 2))
(defun my-scroll-left-double () (interactive) (scroll-right-1 6))
(defun my-scroll-left-triple () (interactive) (scroll-right-1 12))
(defun my-scroll-right-single () (interactive) (scroll-left-1 2))
(defun my-scroll-right-double () (interactive) (scroll-left-1 6))
(defun my-scroll-right-triple () (interactive) (scroll-left-1 12))
(global-set-key [wheel-up] 'my-scroll-up-single)
(global-set-key [double-wheel-up] 'my-scroll-up-double)
(global-set-key [triple-wheel-up] 'my-scroll-up-triple)
(global-set-key [wheel-down] 'my-scroll-down-single)
(global-set-key [double-wheel-down] 'my-scroll-down-double)
(global-set-key [triple-wheel-down] 'my-scroll-down-triple)
(global-set-key [wheel-right] 'my-scroll-right-single)
(global-set-key [double-wheel-right] 'my-scroll-right-double)
(global-set-key [triple-wheel-right] 'my-scroll-right-triple)
(global-set-key [wheel-left] 'my-scroll-left-single)
(global-set-key [double-wheel-left] 'my-scroll-left-double)
(global-set-key [triple-wheel-left] 'my-scroll-left-triple)
(global-set-key [S-wheel-right] 'my-scroll-right-single)
(global-set-key [S-double-wheel-right] 'my-scroll-right-double)
(global-set-key [S-triple-wheel-right] 'my-scroll-right-triple)
(global-set-key [S-wheel-left] 'my-scroll-left-single)
(global-set-key [S-double-wheel-left] 'my-scroll-left-double)
(global-set-key [S-triple-wheel-left] 'my-scroll-left-triple)
