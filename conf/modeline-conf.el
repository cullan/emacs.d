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
  (setq rm-blacklist
        (format "^ \\(%s\\)$"
                (mapconcat #'identity
                           '("FlyC.*"
                             "Flymake.*"
                             "LSP.*"
                             "Projectile.*"
                             "WS"
                             "Helm"
                             "Paredit"
                             "yas")
                           "\\|")))
  (rich-minority-mode 1))

(provide 'modeline-conf)

;;; modeline-conf.el ends here
