(use-package helm
  :config (progn
    ;; Enable helm
    (helm-mode 1)

    ;; Instead of creating a split for helm buffer, just temporarily take over the
    ;; current window instead
    (setq helm-split-window-default-side 'same)

    ;; Override helm fuzzy matching function to disable the feature
    (defun helm-fuzzy-match (candidate))
    (defun helm-fuzzy-search (pattern))
  )
  :bind (
    ;; Helm override of default keys
    ("M-x" . helm-M-x)
    ("C-x f" . helm-find-files)
    ("C-x C-f" . helm-find-files)
    ("C-x C-b" . helm-mini)

    ;; Custom helm bindings
    ("C-c b l" . helm-mini)
    ("C-c s o" . helm-occur)
    ("C-c r e" . helm-resume)
  )
)

(use-package helm-ag
  :config (progn
    (setq helm-ag-base-command "/usr/local/bin/pt --nocolor --nogroup")
  )
)
