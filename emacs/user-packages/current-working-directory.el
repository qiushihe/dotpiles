;; Declare variables
(make-variable-frame-local 'cwd-frame-working-dir)

(add-hook 'after-make-frame-functions (lambda (frame)
  "Copy working directory value from the previous frame to the newly created frame"
  (cwd-set-frame-working-directory frame (cwd-get-frame-working-directory (previous-frame)))
))

(defun cwd-set-frame-working-directory (frame directory)
  "Set the working directory value for the given frame"
  (modify-frame-parameters frame (list (cons 'cwd-frame-working-dir directory)))
)

(defun cwd-get-frame-working-directory (frame)
  "Get the working directory value for the given frame"
  (frame-parameter frame 'cwd-frame-working-dir)
)

(add-hook 'window-configuration-change-hook (lambda ()
  ;; (make-local-variable 'cwd-buffer-working-dir)

  ;; (message "INSIDE window-configuration-change-hook: %s ... %s" cwd-buffer-working-dir (cwd-get-frame-working-directory (selected-frame)))
  ;;(if (not cwd-buffer-working-dir)
  ;;  (message "SETTING cwd-buffer-working-dir for %s to: %s" (buffer-name) (cwd-get-frame-working-directory (selected-frame)))
  ;;  (setq cwd-buffer-working-dir (cwd-get-frame-working-directory (selected-frame)))
  ;;)
))

(add-hook 'after-change-major-mode-hook (lambda ()
  ;;(if (not cwd-buffer-working-dir)
  ;;  (message "SETTING cwd-buffer-working-dir for %s to: %s" (buffer-name) (cwd-get-frame-working-directory (selected-frame)))
  ;;  (setq cwd-buffer-working-dir (cwd-get-frame-working-directory (selected-frame)))
  ;;)
  ;; (defvar-local cwd-buffer-working-dir "LALA")
  ;; (message "FOR %s cwd-buffer-working-dir is %s" (buffer-name) cwd-buffer-working-dir)

  ;;(if (not (boundp 'cwd-buffer-working-dir))
  ;;  (message "SETTING cwd-buffer-working-dir for %s to: %s" (buffer-name) (cwd-get-frame-working-directory (selected-frame)))
  ;;  (defvar-local cwd-buffer-working-dir (cwd-get-frame-working-directory (selected-frame)))
  ;;)
))

;; (defvar-local lala "LALA")
;; (buffer-local-value 'lala  (current-buffer))
;; (buffer-local-value 'cwd-buffer-working-dir  (current-buffer))
