;; Disable menu bar
(menu-bar-mode nil)

;; Disable srgb to avoid some colour issues (i.e. with powerline)
(setq ns-use-srgb-colorspace nil)

;; Disable splash screen/message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; Disable lockfile for unsaved buffers
(setq create-lockfiles nil)

;; Disable backup
(setq backup-inhibited t)

;; Disable auto-save
(setq auto-save-default nil)

;; Disable line wrap
(set-default 'truncate-lines t)
(setq truncate-partial-width-windows nil)

;; Disable Electric indent mode
(electric-indent-mode -1)
(add-hook 'after-change-major-mode-hook (lambda () (electric-indent-mode -1)))

;; Disable bell
(setq ring-bell-function 'ignore)

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

;; Always end a file with a newline
(setq require-final-newline t)

;; Mode Line
(setq line-number-mode t)
(setq column-number-mode t)

;; Thin cursor
(setq-default cursor-type 'bar)

;; Show full file path in frame title
(setq frame-title-format '(buffer-file-name "%f" (dired-directory dired-directory "%b")))

;; Auto revert to changes made by external programs
(global-auto-revert-mode t)

;; Load non-managed packages
(add-to-list 'load-path "~/.emacs.d/user-packages")
(load-library "line-number")
(load-library "trim-white-space")
(load-library "bindings")
(load-library "matching-parenthesis")
(load-library "switch-to-previous-buffer")
(load-library "skip-esc-close-split")
(load-library "smarter-move-beginning-of-line")

(load-library "normalize-indent")
(normalize-indent-global-mode)

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

(el-get-bundle el-get)

(el-get-bundle coffee-mode)
(el-get-bundle handlebars-mode)
(el-get-bundle markdown-mode)
(el-get-bundle sass-mode)
(el-get-bundle yaml-mode)
(el-get-bundle company-mode)
(el-get-bundle org-mode)

(el-get-bundle column-marker)
(el-get-bundle expand-region)
(el-get-bundle flyspell)
(el-get-bundle multiple-cursors)
(el-get-bundle neotree)
(el-get-bundle powerline)
(el-get-bundle projectile)
(el-get-bundle smooth-scroll)
(el-get-bundle buffer-move)
(el-get-bundle hiwin)
(el-get-bundle color-theme-solarized)

(el-get-bundle helm)
(el-get-bundle helm-ag)
(el-get-bundle helm-cmd-t)

;; Set font
(set-default-font "Monaco 12")

;; Load theme
(load-theme 'solarized t)

;; Set default frame properties
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))

;; Enable disabled commands
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)

;; Customize variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
