;;; company-conf.el --- Configure company-mode

;;; Commentary:
;; Company allows text auto-complete.

;;; Code:

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common))

(provide 'company-conf)

;;; company-conf.el ends here
