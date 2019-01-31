;;; init.el --- Initialization file

;;; Commentary:
;; Configure Emacs.

;;; Code:

(add-to-list 'load-path "~/.emacs.d/src/")
(setq custom-file "~/.emacs.d/conf/custom.el") ; custom variables

(defun load-directory (dir)
  "Load all .el files in DIR."
  (mapc (lambda (f)
            (load-file (concat (file-name-as-directory dir) f)))
        (directory-files dir nil "\\.el$")))

(load "~/.emacs.d/emacs-conf.el")
(load "~/.emacs.d/package-manager-conf.el")

(load-directory "~/.emacs.d/conf/")

(load custom-file)

(provide 'init)

;;; init.el ends here
