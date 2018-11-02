;;; magit-conf.el --- Configure magit, the greatest package in the world.

;;; Commentary:
;; Magit is an interface to git.

;;; Code:

(use-package magit
  :ensure t
  :bind ("C-c g" . magit-status)
  :custom
  (magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256"))))

(provide 'magit-conf)

;;; magit-conf.el ends here
