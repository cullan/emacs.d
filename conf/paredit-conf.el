;;; paredit-conf.el --- Configure paredit.
;; paraedit

;;; Commentary:
;; Paredit makes it easier to edit sexps.

;;; Code:

(use-package
 paredit
 :ensure t
 :hook ((emacs-lisp-mode . paredit-mode)
        (clojure-mode . paredit-mode)
        (cider-repl-mode . paredit-mode)
        (cider-mode . paredit-mode)))

(provide 'paredit-conf)

;;; paredit-conf.el ends here
