(require 'epa)

(setq password-cache-expiry nil)

(defvar have-private-key
  (string= (shell-command-to-string "gpg --list-secret-keys | grep 720FD288FB5BBF5DE3A4BEBA92C6AB6D6C229F93 | wc -l") "1\n"))

(if have-private-key
    (add-to-list 'load-suffixes ".el.gpg")
  (message "WARNING: Private GPG key not found"))

(defun read-gpg-file (file)
  (let ((file-to-decrypt (expand-file-name file user-emacs-directory))
	(ctx (epg-make-context epa-protocol)))
    (if (not (file-exists-p file-to-decrypt))
	(progn
	  (error "File %s does not exist" file-to-decrypt)
	  (message "Decrypting %s...failed" file-to-decrypt))
      (epg-decrypt-file ctx file-to-decrypt nil)
      (message "Decrypting %s...done" file-to-decrypt))))

(defun load-gpg (file)
  (if have-private-key
      (load file)
    (message "WARNING: Couldn't load %s (No gpg key found)" file)))
