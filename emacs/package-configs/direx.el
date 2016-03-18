(use-package direx
  :config (progn
	  (require 'direx-project))
  :bind (
    ("C-c t p" . direx-project:jump-to-project-root)
    ("C-c t t" . direx:jump-to-directory)))
