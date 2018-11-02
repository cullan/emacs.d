;;; shell-path-conf.el --- Configure check-path-from-shell package.
;; use PATH from the shell

;;; Commentary:
;; Make Emacs use the same PATH as the shell.

;;; Code:

(use-package
 exec-path-from-shell
 :ensure t
 :init
 (setq exec-path-from-shell-check-startup-files nil)
 (when window-system (exec-path-from-shell-copy-env "PATH")))

(provide 'shell-path-conf)

;;; shell-path-conf.el ends here
