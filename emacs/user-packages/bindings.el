;; Unbind some OSX-specific bindings
(global-unset-key (kbd "s-s"))
(global-unset-key (kbd "s-a"))
(global-unset-key (kbd "s-z"))
(global-unset-key (kbd "s-Z"))
(global-unset-key (kbd "s-c"))
(global-unset-key (kbd "s-x"))
(global-unset-key (kbd "s-v"))
(global-unset-key (kbd "s-w"))
(global-unset-key (kbd "s-q"))
(global-unset-key (kbd "s-k"))

;; Rebind kill-this-buffer
(global-set-key (kbd "C-c b d") 'kill-this-buffer)

;; Rebind create/delete frame
(global-set-key (kbd "C-c f c") 'new-frame)
(global-set-key (kbd "C-c f d") 'delete-frame)

;; Rebind delete-window
(global-set-key (kbd "C-c w d") 'delete-window)

;; Split window
(global-set-key (kbd "C-c s v") 'split-window-right)
(global-set-key (kbd "C-c s h") 'split-window-below)

;; Switch window focus
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <down>") 'windmove-down)
(global-set-key (kbd "C-c <up>") 'windmove-up)

;; Resize window
(global-set-key (kbd "C-M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<down>") 'shrink-window)
(global-set-key (kbd "C-M-<up>") 'enlarge-window)

;; Swap window
(global-set-key (kbd "C-c S-<right>") 'buf-move-right)
(global-set-key (kbd "C-c S-<left>") 'buf-move-left)
(global-set-key (kbd "C-c S-<down>") 'buf-move-down)
(global-set-key (kbd "C-c S-<up>") 'buf-move-up)

;; Keyboard scrolling speed
(setq scroll-step 10)
(setq hscroll-step 10)

;; Mouse scrolling settings
(setq mouse-autoselect-window t)
(setq mouse-wheel-follow-mouse 't)

;; Prevent Esc-Esc-Esc from closing splits
(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda (&optional nomini all-frames) t))
    (unwind-protect
      ad-do-it
      (fset 'one-window-p (symbol-function 'orig-one-window-p))
    )
  )
)
