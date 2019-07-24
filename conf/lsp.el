;;; lsp.el --- LSP

;;; Commentary:
;; Language Server Protocol (LSP)

;;; Code:

(use-package lsp-mode
  :ensure t
  :commands lsp )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config (push 'company-lsp company-backends))

(provide 'lsp)

;;; lsp.el ends here
