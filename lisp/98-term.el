(require 'xterm-color)
(require 'eshell)

(setenv "TERM" "st-256color")

(setq term-unbind-key-list '("C-z" "C-x" "C-c" "C-t" "C-h" "C-y" "C-v" "<ESC>"))

(setq comint-terminfo-terminal "st-256color"
      comint-prompt-read-only t)

(setq comint-output-filter-functions
      (remove 'ansi-color-process-output comint-output-filter-functions))

(add-hook 'shell-mode-hook
	  (lambda () (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t)))

(add-hook 'eshell-before-prompt-hook
	  (lambda () (setq xterm-color-preserve-properties t)))

(add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
(setq eshell-output-filter-functions (remove 'eshell-handle-ansi-color eshell-output-filter-functions))
