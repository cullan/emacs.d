;;; magit-conf.el --- Configure magit, the greatest package in the world.

;;; Commentary:
;; Magit is an interface to git.

;;; Code:

(use-package magit
  :ensure t
  :bind ("C-c g" . magit-status)
  :config
  (setq magit-diff-refine-hunk 'all)
  :custom
  (magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
  (magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18)))

(use-package forge
  :ensure t
  :after magit)

(use-package git-link
  :ensure t)

(provide 'magit-conf)

;;; magit-conf.el ends here
