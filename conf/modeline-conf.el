;;; modeline-conf.el --- modeline configuration

;;; Commentary:
;; Use smart-mode-line

;;; Code:

(use-package smart-mode-line
  :ensure t)

(use-package smart-mode-line-powerline-theme
  :ensure t
  :after smart-mode-line
  :init
  (progn (setq sml/no-confirm-load-theme t))
  :config
  (sml/setup)
  (sml/apply-theme 'powerline))

(use-package rich-minority
  :ensure t
  :after smart-mode-line
  :config
  (rich-minority-mode 1)
  (setq rm-blacklist
        (format "^ \\(%s\\)$"
                (mapconcat #'identity
                           '("FlyC.*"
                             "Projectile.*"
                             "WS"
                             "Helm"
                             "Paredit"
                             "yas")
                           "\\|"))))

(provide 'modeline-conf)

;;; modeline-conf.el ends here
