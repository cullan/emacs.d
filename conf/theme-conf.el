;;; theme-conf.el --- Select a theme for Emacs

;;; Commentary:
;; Make zenburn the Emacs theme.

;;; Code:

(use-package zenburn-theme
  :ensure t)

(use-package material-theme
  :ensure t
  :config (load-theme 'material t))

(use-package dracula-theme
  :ensure t)

(provide 'theme-conf)

;;; theme-conf.el ends here
