;;; rainbow-delimiters-conf.el --- Rainbow Delimiters

;;; Commentary:
;; Color delimiters in alternating colors to make matching them up
;; visually easier.

;;; Code:

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'rainbow-delimiters-conf)

;;; rainbow-delimiters-conf.el ends here
