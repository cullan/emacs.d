;;; javascript-conf.el --- Javascript configuration

;;; Commentary:
;; A necessary evil

;;; Code:

(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'"
         "\\.json\\'")
  :interpreter "node"
  :hook (js2-mode . (lambda ()
                      (when (string-match "\\.json\\'" (buffer-file-name))
                        (flycheck-mode 0))))
  :config
  (setq js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil
        js-indent-level 2
        js-expr-indent-offset -4
        js-switch-indent-offset 2))

(use-package rjsx-mode
  :ensure t
  :mode "\\.jsx\\'"
  :magic ("^\\(.*\n\\)*.*import React" . rjsx-mode))

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  "Use node-modules eslint if available."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js" root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; (use-package js
;;   :init
;;   ;; (add-hook 'js-mode-hook #'lsp)
;;   (setq js-indent-level 2))

;; (use-package prettier-js
;;   :ensure t
;;   :after js2-mode
;;   :init
;;   (add-hook 'js2-mode-hook 'prettier-js-mode))

(provide 'javascript-conf)

;;; javascript-conf.el ends here
