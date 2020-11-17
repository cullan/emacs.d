;;; init.el --- Initialization file

;;; Commentary:
;; Configure Emacs.

;;; Code:

(defun load-directory (dir)
  "Load all .el files in DIR."
  (mapc (lambda (f)
            (load-file (concat (file-name-as-directory dir) f)))
        (directory-files dir nil "\\.el$")))

(let* ((default-directory "~/.config/emacs/")
       (custom-file (expand-file-name "conf/custom.el"))) ; custom variables
  (add-to-list 'load-path (expand-file-name "src"))
  (load (expand-file-name "emacs-conf.el"))
  (load (expand-file-name "package-manager-conf.el"))
  (load-directory (expand-file-name "conf"))
  (load custom-file))

;; default to finding files in the home directory
(setq default-directory (concat (getenv "HOME") "/"))

(provide 'init)

;;; init.el ends here
