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

;; Always show matching parenthesis
(setq show-paren-delay 0)
(show-paren-mode t)
(setq blink-matching-paren t)

;; Auto-insert matching parenthesis
(electric-pair-mode 1)

;; Delete selection when typing
(delete-selection-mode 1)

;; Insert 2 spaces for tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Make tab behave "normally"
(defun my-tab ()
  (interactive)
  (insert "  "))
(global-set-key "\t" 'my-tab)
(add-hook 'after-change-major-mode-hook (lambda () (local-set-key "\t" 'my-tab)))

;; Make auto-indent behave "normally"
(defun my-enter ()
  (interactive)
  (newline)
  (indent-relative-maybe))
(global-set-key (kbd "RET") 'my-enter)
(add-hook 'after-change-major-mode-hook (lambda () (local-set-key (kbd "RET") 'my-enter)))

;; Always end a file with a newline
(setq require-final-newline t)

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

;; Mode Line
(setq line-number-mode t)
(setq column-number-mode t)

;; Auto revert to changes made by external programs
(global-auto-revert-mode t)

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
(setq neo-window-width 39)
(global-set-key (kbd "M-]") 'neotree-toggle)

;; Ag.el (the silver searcher)
(setq ag-reuse-buffers t)
(setq ag-reuse-window t)
(global-set-key (kbd "M-r") 'ag-project)

;; Enable smooth scroll
(smooth-scroll-mode t)

;; Set page guide
(add-hook 'after-change-major-mode-hook (lambda ()
  (interactive)
  (column-marker-3 100)))

;; Org mode
(setq org-support-shift-select t)

;; Helm
(helm-mode 1)
(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
;;(global-set-key (kbd "C-t") 'helm-cmd-t)
(global-set-key (kbd "C-t") 'helm-projectile)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Projectile
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)

;; Sml Mode Line
(sml-modeline-mode)

;; Multiple cursors
(global-set-key (kbd "s-<mouse-1>") 'mc/add-cursor-on-click)

;; Load theme
(load-theme 'monokai t)

;; Enable disabled commands
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/Dropbox/OrgMode/MetaLab.org" "~/Dropbox/OrgMode/Personal.org" "~/Dropbox/OrgMode/test.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
