;;; elpy-conf.el --- Configure elpy.

;;; Commentary:
;; Python editing for Emacs.

;;; Code:

(use-package elpy
  :ensure t
  :custom
  (elpy-rpc-python-command "python3")
  (python-shell-interpreter "ipython")
  (python-shell-interpreter-args "-i --simple-prompt")
  :config
  (pyvenv-activate "~/src/python/virtualenvs/default")
  (elpy-enable))

(provide 'elpy-conf)

;;; elpy-conf.el ends here
