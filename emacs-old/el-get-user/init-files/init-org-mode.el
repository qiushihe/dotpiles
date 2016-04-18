(setq org-support-shift-select t)

(add-to-list 'auto-mode-alist '("\\.org.txt\\'" . org-mode))

(setq org-directory "~/Dropbox/Org")

;; Setup capture
(setq org-default-notes-file (concat org-directory "/Inbox.org"))
(define-key global-map (kbd "C-c o c") 'org-capture)
(setq org-capture-templates '(
  ("t" "Todo" entry (file+headline org-default-notes-file "Tasks") "* TODO %?")
  ("n" "Note" entry (file+headline org-default-notes-file "Notes") "* %U %?")
))

;; Setup agenda files
(setq org-agenda-files (list
  (concat org-directory "/Inbox.org")
  (concat org-directory "/test.org")
))
