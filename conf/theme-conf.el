;;; theme-conf.el --- Select a theme for Emacs

;;; Commentary:
;; Make zenburn the Emacs theme.

;;; Code:

(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

(provide 'theme-conf)

;;; theme-conf.el ends here
