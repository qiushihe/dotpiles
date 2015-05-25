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

;; Rebind create/delete frame
(bind-key* "C-c f c" 'new-frame)
(bind-key* "C-c f d" 'delete-frame)

;; Rebind delete-window
(bind-key* "C-c w d" 'delete-window)

;; Split window
(bind-key* "C-c s v" 'split-window-right)
(bind-key* "C-c s h" 'split-window-below)

;; Switch window focus
(bind-key* "C-c <left>" 'windmove-left)
(bind-key* "C-c <right>" 'windmove-right)
(bind-key* "C-c <down>" 'windmove-down)
(bind-key* "C-c <up>" 'windmove-up)

;; Resize window
(bind-key* "C-S-<left>" 'shrink-window-horizontally)
(bind-key* "C-S-<right>" 'enlarge-window-horizontally)
(bind-key* "C-S-<down>" 'shrink-window)
(bind-key* "C-S-<up>" 'enlarge-window)

;; Swap window
(bind-key* "C-c S-<right>" 'buf-move-right)
(bind-key* "C-c S-<left>" 'buf-move-left)
(bind-key* "C-c S-<down>" 'buf-move-down)
(bind-key* "C-c S-<up>" 'buf-move-up)

;; Keyboard scrolling speed
(setq scroll-step 10)
(setq hscroll-step 10)

;; Mouse scrolling settings
(setq mouse-autoselect-window t)
(setq mouse-wheel-follow-mouse 't)
