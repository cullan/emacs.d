;;; python-conf.el --- Beautiful is better than ugly.

;;; Commentary:
;; Python editing for Emacs.

;;; Code:

(use-package elpy
  :ensure t
  :config
  (setq elpy-rpc-python-command "python3"
        python-shell-interpreter "ipython"
        python-shell-interpreter-args "--simple-prompt -c exec('__import__(\\'readline\\')') -i"
        elpy-syntax-check-command (locate-user-emacs-file "elpy/rpc-venv/bin/flake8")
        elpy-shell-starting-directory 'current-directory)
  (elpy-enable))

(provide 'python-conf)

;;; python-conf.el ends here
