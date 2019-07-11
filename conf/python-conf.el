;;; python-conf.el --- Beautiful is better than ugly.

;;; Commentary:
;; Python editing for Emacs.

;;; Code:

(use-package pipenv
  :ensure t
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

(use-package elpy
  :ensure t
  :after pipenv
  :custom
  (elpy-rpc-python-command "python")
  (python-shell-interpreter "ipython")
  (python-shell-interpreter-args "-i --simple-prompt")
  :config
  ; (pyvenv-activate "~/.virtualenvs/default") ; TODO: use current project
  (elpy-enable))

(provide 'python-conf)

;;; python-conf.el ends here
