;;; flycheck-conf.el --- Configure flycheck.

;;; Commentary:
;; Flycheck runs syntax checkers and linters on buffers.

;;; Code:

(use-package flycheck
  :ensure t
  :config (setq flycheck-global-modes '(not python-mode fundamental-mode))
  :init (global-flycheck-mode))

(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :init
  (flycheck-pos-tip-mode))

(provide 'flycheck-conf)

;;; flycheck-conf.el ends here
