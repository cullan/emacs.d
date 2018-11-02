;;; clojure-conf.el --- Configure Clojure stuff.

;;; Commentary:
;; Add cider, helm-cider and flycheck to clojure mode.

;;; Code:

(use-package clojure-mode
  :ensure t
  :after flycheck cider
  :pin melpa
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.cljs\\'" . clojurescript-mode)))

(use-package cider
  :ensure t
  :custom
  (cider-repl-display-help-banner nil))

(use-package helm-cider
  :ensure t
  :after cider helm
  :config
  (helm-cider-mode 1))

(use-package flycheck-clojure
  :ensure t
  :after flycheck clojure cider
  :init
  (flycheck-clojure-setup))

(provide 'clojure-conf)

;;; clojure-conf.el ends here
