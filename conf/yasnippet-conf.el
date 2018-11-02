;;; yasnippet-conf.el --- Configure yasnippet.

;;; Commentary:
;; Install yasnippet and snippets.

;;; Code:

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  :hook (elixir-mode . yas-minor-mode))

(use-package clojure-snippets
  :ensure t)

(provide 'yasnippet-conf)

;;; yasnippet-conf.el ends here
