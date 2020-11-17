;;; yaml.el --- Configure yaml-mode

;;; Commentary:
;; Install the package and use it

;;; Code:

(use-package yaml-mode
  :ensure t
  :mode ("\\.yml\\'" . yaml-mode))

(provide 'yaml)

;;; yaml.el ends here
