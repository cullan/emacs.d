;;; javascript-conf.el --- Javascript configuration

;;; Commentary:
;; A necessary evil

;;; Code:

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

(use-package js-mode
  :mode ("\\.js\\'"
         "\\.json\\'")
  :interpreter "node"
  :hook (js-mode . (lambda ()
                     (when (string-match "\\.json\\'" (buffer-file-name))
                       (flycheck-mode 0))))
  :init
  (advice-add 'js--multi-line-declaration-indentation :around (lambda (orig-fun &rest args) nil))
  :custom
  (js-indent-level 2)
  (js-switch-indent-offset 2))

(provide 'javascript-conf)

;;; javascript-conf.el ends here
