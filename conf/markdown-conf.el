;;; markdown-conf.el --- Configure markdown-mode

;;; Commentary:
;; Install the package and use it for the proper files

;;; Code:

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))

(provide 'markdown-conf)

;;; markdown-conf.el ends here
