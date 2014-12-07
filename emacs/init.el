;; Disable some UI features
(menu-bar-mode -1)
(when (display-graphic-p) (tool-bar-mode -1))
(when (display-graphic-p) (scroll-bar-mode -1))

;; Disable splash screen/message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

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

;; Load non-managed packages
(add-to-list 'load-path "~/.emacs.d/user-packages")
(load-library "bindings")

;; Managed packages via el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(setq el-get-user-package-directory "~/.emacs.d/el-get-user/init-files")
(el-get 'sync)

;; Load theme
(load-theme 'monokai t)

;; Enable disabled commands
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)

;; Customize variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/Dropbox/OrgMode/Walmart.org" "~/Dropbox/OrgMode/MetaLab.org" "~/Dropbox/OrgMode/Personal.org" "~/Dropbox/OrgMode/test.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
