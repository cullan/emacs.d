;;; whitespace-conf.el --- Configure whitespace-mode

;;; Commentary:
;; Ignore spaces but highlight tabs, trailing, and other unwanted
;; whitespace.

;;; Code:

(use-package whitespace
  :ensure t
  :custom
  (whitespace-style '(face tabs trailing lines space-before-tab newline
                           indentation empty space-after-tab space
                           mark tab-mark newline-mark))
  :config
  (global-whitespace-mode 1))

(provide 'whitespace-conf)

;;; whitespace-conf.el ends here
