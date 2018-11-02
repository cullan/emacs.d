;;; paredit-conf.el --- Configure paredit.
;; paraedit

;;; Commentary:
;; Paredit makes it easier to edit sexps.

;;; Code:

(use-package
 paredit
 :ensure t
 :hook ((emacs-lisp-mode . (lambda () (paredit-mode 1)))
        (clojure-mode . (lambda () (paredit-mode 1)))))

(provide 'paredit-conf)

;;; paredit-conf.el ends here
