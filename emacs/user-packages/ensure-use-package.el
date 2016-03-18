(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '())
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Always automatically missing packages
(setq use-package-always-ensure t)

;; Setup individual packages
(load "~/.emacs.d/package-configs/helm")
(load "~/.emacs.d/package-configs/projectile")
