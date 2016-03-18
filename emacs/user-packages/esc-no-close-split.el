;; Prevent Esc-Esc-Esc from closing splits
(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda (&optional nomini all-frames) t))
    (unwind-protect
      ad-do-it
      (fset 'one-window-p (symbol-function 'orig-one-window-p)))))
