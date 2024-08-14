;; This file is loaded by Doom's config.el.
;; THis file is intended to hold configurations not specific to Doom.

;; Disable Emacs quit message
(setq confirm-kill-emacs nil)

;; Bind or-mode's "go back" to a function with a more sensible name
(defalias 'org-go-back 'org-mark-ring-goto)

;; Function to save all open buffers without prompt
(defun my-save-all-buffers ()
  "Save all open buffers without prompt"
  (interactive)
  (save-some-buffers t))
