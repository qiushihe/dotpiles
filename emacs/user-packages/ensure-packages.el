;; Some initial setup for packages
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '())
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;; Install quelpa
(unless (package-installed-p 'quelpa)
  (package-refresh-contents)
  (package-install 'quelpa))

;; Install quelpa-use-package
(quelpa '(quelpa-use-package
  :fetcher git
  :url "https://framagit.org/steckerhalter/quelpa-use-package.git"))
(require 'quelpa-use-package)
(setq use-package-ensure-function 'quelpa)

;; Always automatically install missing packages
(setq use-package-always-ensure t)

;; Setup individual packages
(load "~/.emacs.d/package-configs/diminish")
(load "~/.emacs.d/package-configs/exec-path-from-shell")
(load "~/.emacs.d/package-configs/editorconfig")
(load "~/.emacs.d/package-configs/helm")
(load "~/.emacs.d/package-configs/projectile")
(load "~/.emacs.d/package-configs/treemacs")
(load "~/.emacs.d/package-configs/flyspell")
(load "~/.emacs.d/package-configs/company")
(load "~/.emacs.d/package-configs/expand-region")
(load "~/.emacs.d/package-configs/avy")
(load "~/.emacs.d/package-configs/magit")

(load "~/.emacs.d/package-configs/stylus-mode")
(load "~/.emacs.d/package-configs/web-mode")

(load "~/.emacs.d/package-configs/solarized")
