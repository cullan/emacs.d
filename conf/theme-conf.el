;;; theme-conf.el --- Select a theme for Emacs

;;; Commentary:
;; Load a theme

;;; Code:

(use-package spacemacs-common
    :ensure spacemacs-theme
    :config
    (load-theme 'spacemacs-dark t))

(provide 'theme-conf)

;;; theme-conf.el ends here
