;;; projectile-conf.el --- Configure projectile.

;;; Commentary:
;; Projectile helps manage projects.

;;; Code:

(use-package projectile
  :ensure t
  :after helm helm-projectile
  :custom
  (projectile-completion-system 'helm)
  (projectile-switch-project-action 'helm-projectile)
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode)
  (helm-projectile-on))

(provide 'projectile-conf)

;;; projectile-conf.el ends here
