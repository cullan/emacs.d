;;; clojure-conf.el --- Configure Clojure stuff.

;;; Commentary:
;; Add cider, helm-cider and flycheck to clojure mode.

;;; Code:

(use-package clojure-mode
  :ensure t
  :after flycheck cider
  :pin melpa
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.cljs\\'" . clojurescript-mode))
  :init
  ;; indent fn-traced and defn-traced the same as a regular defn.
  ;; the macros are for re-frame-10x tracing
  (put-clojure-indent 'fn-traced :defn)
  (put-clojure-indent 'defn-traced :defn))

(use-package cider
  :ensure t
  :after company
  :custom
  (cider-repl-display-help-banner nil)
  :hook
  ((cider-repl-mode . company-mode)
   (cider-mode . company-mode)))

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
