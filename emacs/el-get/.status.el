((ag status "installed" recipe
     (:name ag :description "A simple ag frontend, loosely based on ack-and-half.el." :type github :pkgname "Wilfred/ag.el" :depends
            (dash s)))
 (column-marker status "installed" recipe
                (:name column-marker :description "Highlight certain character columns" :type emacswiki :features column-marker))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
                ("el-get.*\\.el$" "methods/")
                :load "el-get.el"))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (f status "installed" recipe
    (:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
           (s dash)
           :type github :pkgname "rejeep/f.el"))
 (hbs-mode status "installed" recipe
           (:name hbs-mode :website "https://github.com/danielevans/handlebars-mode" :description "Emacs Major Mode for Handlebars" :type github :pkgname "danielevans/handlebars-mode"))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :build
              ("make")
              :build/darwin
              `(("make" ,(format "EMACS_COMMAND=%s" el-get-emacs)))
              :build/windows-nt
              (with-temp-file "helm-autoload.el" nil)))
 (helm-cmd-t status "installed" recipe
             (:name helm-cmd-t :description "Cmd-t style completion of files in repository." :type github :pkgname "lewang/helm-cmd-t" :depends
                    (helm)))
 (markdown-mode status "installed" recipe
                (:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :website "http://jblevins.org/projects/markdown-mode/" :type git :url "git://jblevins.org/git/markdown-mode.git" :prepare
                       (add-to-list 'auto-mode-alist
                                    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (monokai-theme status "installed" recipe
                (:name monokai-theme :website "https://github.com/oneKelvinSmith/monokai-emacs" :description "A fruity color theme for Emacs." :type elpa :prepare
                       (add-to-list 'custom-theme-load-path default-directory)))
 (multiple-cursors status "installed" recipe
                   (:name multiple-cursors :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el"))
 (neotree status "installed" recipe
          (:name neotree :website "https://github.com/jaypei/emacs-neotree" :description "An Emacs tree plugin like NerdTree for Vim." :type github :branch "master" :pkgname "jaypei/emacs-neotree"))
 (org-mode status "installed" recipe
           (:name org-mode :website "http://orgmode.org/" :description "Org-mode is for keeping notes, maintaining ToDo lists, doing project planning, and authoring with a fast and effective plain-text system." :type git :url "git://orgmode.org/org-mode.git" :info "doc" :build/berkeley-unix `,(mapcar
                                                                                                                                                                                                                                                                                                       (lambda
                                                                                                                                                                                                                                                                                                         (target)
                                                                                                                                                                                                                                                                                                         (list "gmake" target
                                                                                                                                                                                                                                                                                                               (concat "EMACS="
                                                                                                                                                                                                                                                                                                                       (shell-quote-argument el-get-emacs))))
                                                                                                                                                                                                                                                                                                       '("oldorg"))
                  :build `,(mapcar
                            (lambda
                              (target)
                              (list "make" target
                                    (concat "EMACS="
                                            (shell-quote-argument el-get-emacs))))
                            '("oldorg"))
                  :load-path
                  ("." "contrib/lisp" "lisp")
                  :load
                  ("lisp/org-loaddefs.el")))
 (package status "installed" recipe
          (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
                 (progn
                   (let
                       ((old-package-user-dir
                         (expand-file-name
                          (convert-standard-filename
                           (concat
                            (file-name-as-directory default-directory)
                            "elpa")))))
                     (when
                         (file-directory-p old-package-user-dir)
                       (add-to-list 'package-directory-list old-package-user-dir)))
                   (setq package-archives
                         (bound-and-true-p package-archives))
                   (mapc
                    (lambda
                      (pa)
                      (add-to-list 'package-archives pa 'append))
                    '(("ELPA" . "http://tromey.com/elpa/")
                      ("melpa" . "http://melpa.org/packages/")
                      ("gnu" . "http://elpa.gnu.org/packages/")
                      ("marmalade" . "http://marmalade-repo.org/packages/")
                      ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (pkg-info status "installed" recipe
           (:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
                  (dash epl)))
 (s status "installed" recipe
    (:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
 (sml-modeline status "installed" recipe
               (:name sml-modeline :description "Show position in a scrollbar like way in mode-line" :type http :url "http://bazaar.launchpad.net/~nxhtml/nxhtml/main/download/head%3A/smlmodeline.el-20100318165023-n7kkswg6dlq8l6b3-1/sml-modeline.el" :features "sml-modeline"))
 (smooth-scroll status "installed" recipe
                (:name smooth-scroll :description "Minor mode for smooth scrolling." :type emacswiki :features smooth-scroll)))
