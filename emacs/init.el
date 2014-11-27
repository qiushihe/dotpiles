;; Disable some UI features
(when (display-graphic-p)
  (menu-bar-mode -1))
(when (display-graphic-p)
  (tool-bar-mode -1))
(when (display-graphic-p)
  (scroll-bar-mode -1))

;; IDO Mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Disable splash screen/message
(setq inhibit-startup-message t
inhibit-startup-echo-area-message t)

;; Disable backup
(setq backup-inhibited t)

;; Disable auto-save
(setq auto-save-default nil)

;; Disable line wrap
(set-default 'truncate-lines t)
(setq truncate-partial-width-windows nil)

;; Scrolling
(setq scroll-step 1)
(setq hscroll-step 1)

;; Mouse scrolling settings
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-progressive-speed nil)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; Mouse wheel binding
(global-set-key [wheel-up] 'scroll-down-1)
(global-set-key [double-wheel-up] '(lambda () (interactive) (scroll-down-1 3)))
(global-set-key [triple-wheel-up] '(lambda () (interactive) (scroll-down-1 5)))
(global-set-key [wheel-down] 'scroll-up-1)
(global-set-key [double-wheel-down] '(lambda () (interactive) (scroll-up-1 3)))
(global-set-key [triple-wheel-down] '(lambda () (interactive) (scroll-up-1 5)))
(global-set-key [S-wheel-right] 'scroll-left-1)
(global-set-key [S-double-wheel-left] '(lambda () (interactive) (scroll-right-1 3)))
(global-set-key [S-triple-wheel-left] '(lambda () (interactive) (scroll-right-1 5)))
(global-set-key [S-wheel-left] 'scroll-right-1)
(global-set-key [S-double-wheel-right] '(lambda () (interactive) (scroll-left-1 3)))
(global-set-key [S-triple-wheel-right] '(lambda () (interactive) (scroll-left-1 5)))

;; Auto-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Line number
(when (display-graphic-p)
  (global-linum-mode 1))

;; Managed packages via el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; Enable smooth scroll
(smooth-scroll-mode t)

;; Enable disabled commands
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)
