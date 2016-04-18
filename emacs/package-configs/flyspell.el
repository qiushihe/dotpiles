(use-package flyspell
  :config (progn
    ;; Enable flyspell for all content in text (Markdown, etc.) mode
    (add-hook 'text-mode-hook (lambda ()
      (flyspell-mode)))

    ;; Enable flyspell for only comments in programming languages mode
    (add-hook 'prog-mode-hook (lambda ()
      (flyspell-mode -1)
      (flyspell-prog-mode)))
  )
)
