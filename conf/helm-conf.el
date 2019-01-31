;;; helm-conf.el --- Configure helm.

;;; Commentary:
;; Helm makes it easy to select things.

;;; Code:

(use-package helm
  :ensure t
  :init
  (require 'helm-config)
  (global-unset-key (kbd "C-x c")) ; too close to C-x C-c
  :custom
  (helm-M-x-fuzzy-match 1)
  :bind
  (("C-c h"   . helm-command-prefix)
   ("M-x"     . helm-M-x)
   ("<menu>"    . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("C-x b"   . helm-mini))
  :init
  (helm-mode 1))

(use-package helm-projectile
  :ensure t
  :after helm)

(provide 'helm-conf)

;;; helm-conf.el ends here
