;(package-initialize)

(setq inhibit-default-init 1
      load-prefer-newer t)

(defvar my-load-paths
  (mapcar (lambda (p) (concat user-emacs-directory p))
	  '("config"
	    "lisp"
	    "lib/dash"
	    "lib/with-editor"
	    "lib/magit/lisp"
	    "lib/volatile-highlights"
	    "lib/multi-term"
	    "lib/undo-tree"
	    "lib/haskell-mode"
	    "lib/anzu"
	    "lib/notmuch"
	    "lib/helm"
	    "lib/helm-mt"
	    "lib/helm-gtags"
	    "lib/mmm-mode"
	    "lib/s"
	    "lib/notmuch/emacs")))

(mapc (apply-partially 'add-to-list 'load-path) my-load-paths)

(load "my-external-cmds")
(load "ui")
(load "my-helm")
(load "my-pinentry")
(load "my-easypg")
(load-gpg "private-config")
(load "my-multi-term")
(load "my-eshell")
(load "org-mode")
;(load "my-magit")
;(load "haskell")
(load "clang")
(load "python")
(load "sh")
(load "my-notmuch")
;(load "html")
;(load "w3m")
;(load "newsticker")

(mapc 'load (file-expand-wildcards (concat user-emacs-directory "load.d/*.el")))
