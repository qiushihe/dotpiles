;; Disable menu bar
(menu-bar-mode nil)

;; Disable splash screen/message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message "")

;; Disable lockfile for unsaved buffers
(setq create-lockfiles nil)

;; Disable backup
(setq backup-inhibited t)

;; Disable auto-save
(setq auto-save-default nil)

;; Disable bell
(setq ring-bell-function 'ignore)

;; Disable theme safety check
(setq custom-safe-themes t)

;; Disable ruby magic encoding comment
(setq ruby-insert-encoding-magic-comment nil)

;; Always show matching parenthesis
(setq show-paren-delay 0)
(show-paren-mode t)
(setq blink-matching-paren t)

;; Auto-insert matching parenthesis
(electric-pair-mode 1)

;; Delete selection when typing
(delete-selection-mode 1)

;; Mode Line
(setq line-number-mode t)
(setq column-number-mode t)

;; Thin cursor
(setq-default cursor-type 'bar)

;; Highlight current line
;(global-hl-line-mode)

;; Show full file path in frame title
(setq frame-title-format '(buffer-file-name "%f" (dired-directory dired-directory "%b")))

;; Auto revert to changes made by external programs
(global-auto-revert-mode t)

;; Set default frame properties
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))
(add-to-list 'default-frame-alist '(font . "Monaco-14"))
