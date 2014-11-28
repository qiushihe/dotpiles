;; Disable some UI features
(menu-bar-mode -1)
(when (display-graphic-p) (tool-bar-mode -1))
(when (display-graphic-p) (scroll-bar-mode -1))

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

;; Disable Electric indent mode
(electric-indent-mode -1)
(add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))

;; IDO Mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Always show matching parenthesis
(setq show-paren-delay 0)
(show-paren-mode t)
(setq blink-matching-paren t)

;; Insert 2 spaces for tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Make tab behave "normally"
(defun my-tab ()
  (interactive)
  (insert "  "))
(global-set-key (kbd "<tab>") 'my-tab)
(add-hook 'after-change-major-mode-hook (lambda () (local-set-key (kbd "<tab>") 'my-tab)))

;; Make auto-indent behave "normally"
(defun my-enter ()
  (interactive)
  (newline)
  (indent-relative-maybe))
(global-set-key (kbd "RET") 'my-enter)
(add-hook 'after-change-major-mode-hook (lambda () (local-set-key (kbd "RET") 'my-enter)))

;; Always end a file with a newline
(setq require-final-newline nil)

;; Remove extra whitespace on save
(defun delete-trailing-whitespace-and-blank-lines ()
  (interactive)
  (let ((point (point)))
    (delete-trailing-whitespace)
    (goto-char (point-max))
    (delete-blank-lines)
    (goto-char (min point (point-max)))))
(add-hook 'before-save-hook 'delete-trailing-whitespace-and-blank-lines)

;; Line number
(global-linum-mode 1)
(unless (display-graphic-p) ; Only add space between line number and text in non-GUI mode
  (setq linum-format (lambda (line)
    (propertize
      (format
        (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
          (concat "%" (number-to-string w) "d "))
        line) 'face 'linum))))

;; Thin cursor
(defun cursor-shape-hook ()
  (setq cursor-type '(bar . 1)))
(add-hook 'post-command-hook 'cursor-shape-hook)

;; Keyboard scrolling speed
(setq scroll-step 1)
(setq hscroll-step 1)

;; Mouse scrolling settings
(setq mouse-autoselect-window t)
(setq mouse-wheel-follow-mouse 't)
;; (setq mouse-wheel-progressive-speed nil)

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
(global-set-key [S-wheel-right] 'my-scroll-right-single)
(global-set-key [S-double-wheel-right] 'my-scroll-right-double)
(global-set-key [S-triple-wheel-right] 'my-scroll-right-triple)
(global-set-key [S-wheel-left] 'my-scroll-left-single)
(global-set-key [S-double-wheel-left] 'my-scroll-left-double)
(global-set-key [S-triple-wheel-left] 'my-scroll-left-triple)

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

;; NEOTree
(setq neo-window-width 50)

;; ag.el (the silver searcher)
(setq ag-reuse-buffers t)
(setq ag-reuse-window t)

;; Enable smooth scroll
(smooth-scroll-mode t)

;; Load theme
(load-theme 'monokai t)

;; Enable disabled commands
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)
