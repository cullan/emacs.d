;;; web-conf.el --- Configure web-mode.

;;; Commentary:
;; Web mode is for editing HTML and template languages.

;;; Code:

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))
  (setq web-mode-enable-auto-quoting nil
        web-mode-markup-indent-offset 2
        web-mode-attr-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-current-element-highlight t)
  :mode (("\\.eex\\'" . web-mode)
         ("\\.html\\'" . web-mode)))

(provide 'web-conf)

;;; web-conf.el ends here
