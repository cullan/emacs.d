;;; c-lang.el --- C Programming Language config

;;; Commentary:
;; Use LSP with ccls to syntax highlight, complete, find def, etc

;;; Code:

;; frontend to GNU Global

(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers
                '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda ()
           (require 'ccls)
           (lsp))))

(use-package cc-mode
  :commands (c-mode)
  :bind (:map c-mode-map
              ("TAB" . company-indent-or-complete-common)))

(provide 'c-lang)

;;; c-lang.el ends here
