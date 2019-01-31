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
  (defun prevent-whitespace-mode-for-modes ()
    (not (or (derived-mode-p 'helm-mode)
             (derived-mode-p 'vterm-mode))))
  (add-function
   :before-while whitespace-enable-predicate
   'prevent-whitespace-mode-for-modes)

  (global-whitespace-mode 1))

(provide 'whitespace-conf)

;;; whitespace-conf.el ends here
