;;; org-conf.el --- Configure org-mode.

;;; Commentary:
;; Org mode is for outlines, task tracking, etc.

;;; Code:

(use-package org
  :ensure t
  :bind (("C-c i" . org-clock-in)
         ("C-c o" . org-clock-out)))

(use-package ob-elixir
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (elixir . t))))

(provide 'org-conf)

;;; org-conf.el ends here
