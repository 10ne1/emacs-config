(require 'uniquify)
(require 'volatile-highlights)
(require 'undo-tree)

;(add-to-list 'default-frame-alist '(background-color . "#E2E2E2E2"))

(setq-default tab-width 8)

(set-face-attribute 'default nil :height 120)

(setq inhibit-startup-screen 1)

;; (setq-default major-mode 'org-mode)
;; (add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
;; (setq initial-buffer-choice "~/workspace/journal/TODO")

(setq show-paren-style 'parenthesis)

(fset 'yes-or-no-p 'y-or-n-p)

(setq frame-title-format
      '(:eval (if (buffer-file-name)
                  (abbreviate-file-name (buffer-file-name)) "%b")))

; prepend dirnames to identical filenames
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(setq search-highlight 1
      query-replace-highlight 1
      case-fold-search 1)

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(setq backup-by-copying-when-linked 1
      backup-by-copying-when-mismatch 1
      make-backup-files nil)

(load-theme 'zenburn 1)
(blink-cursor-mode 0)
(global-font-lock-mode 1) ; syntax coloring on
(global-auto-revert-mode 1)
(volatile-highlights-mode 1)
(global-undo-tree-mode)
(ido-mode 1)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(column-number-mode 1)
(line-number-mode 1)
(size-indication-mode 1)

(electric-pair-mode 1)
(show-paren-mode 1)

(fringe-mode 4)

;(global-hl-line-mode 1)
