;;; libvterm.el --- libvterm

;;; Commentary:
;; Exciting prospect of a real term inside Emacs.

;;; Code:

(add-to-list 'load-path "~/src/emacs-libvterm")
(require 'vterm)

(add-hook 'vterm-exit-functions (lambda (buf)
                                  (when buf (kill-buffer buf))))

(provide 'libvterm)

;;; libvterm.el ends here
