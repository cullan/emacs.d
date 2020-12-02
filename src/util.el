;;; util.el --- Utility functions

;;; Commentary:
;; misc junk

;;; Code:

(defun load-directory (dir)
  "Load all .el files in DIR."
  (mapc (lambda (f)
            (load-file (concat (file-name-as-directory dir) f)))
        (directory-files dir nil "\\.el$")))

(provide 'util)

;;; util.el ends here
