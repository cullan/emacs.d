;;; javascript-conf.el --- Javascript configuration

;;; Commentary:
;; A necessary evil

;;; Code:

(use-package js
  :init
  (add-hook 'js-mode-hook #'lsp)
  (setq js-indent-level 2))

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :interpreter "node")

(use-package prettier-js
  :ensure t)

(use-package rjsx-mode
  :ensure t
  :mode "\\.jsx\\'"
  :magic ("import React" . rjsx-mode)
  :config
  (with-eval-after-load "lsp-javascript-typescript"
    (add-hook 'rjsx-mode-hook #'lsp)
    (setq js-indent-level 2)))

(provide 'javascript-conf)

;;; javascript-conf.el ends here
