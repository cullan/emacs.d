;;; lsp-conf.el --- Language Server Protocol

;;; Commentary:
;; install and configure packages for lsp

;;; Code:

(use-package lsp-mode
  :ensure t
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(provide 'lsp-conf)

;;; lsp-conf.el ends here
