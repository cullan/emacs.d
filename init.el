;;; init.el --- Initialization file

;;; Commentary:
;; Configure Emacs.

;;; Code:

(add-to-list 'load-path (locate-user-emacs-file "src"))
(load "util")
(declare-function load-directory "util")

(load (locate-user-emacs-file "emacs-conf.el"))
(load (locate-user-emacs-file "package-manager-conf.el"))
(load-directory (locate-user-emacs-file "conf"))
(load (locate-user-emacs-file "conf/custom.el")) ; custom variables

(provide 'init)

;;; init.el ends here
