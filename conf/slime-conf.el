;;; slime-conf.el --- Configure slime.

;;; Commentary:
;; Lisp interaction mode.

;;; Code:

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "/usr/bin/clisp")
  (setq slime-contribs '(slime-fancy)))

(provide 'slime-conf)

;;; slime-conf.el ends here
