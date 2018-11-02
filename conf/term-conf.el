;;; term-conf.el --- Make terminals nicer.

;;; Commentary:
;; Various changes to how terminals work.

;;; Code:

(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  "Kill terminal buffers after the term exits."
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

(defvar my-term-shell "/bin/bash") ; don't ask, just use bash please
(defadvice ansi-term (before force-bash)
  "Use bash as the shell."
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(defun my-term-yank (&optional string)
  "Make yank actually be sent to the terminal process.
STRING is an optional string to send instead of yanking."
  (interactive)
  (process-send-string
   (get-buffer-process (current-buffer))
   (if string string (current-kill 0))))

(defun my-term-cycle ()
  "Cycle through buffers whose major mode is term-mode."
  (interactive)
  (when (string= "term-mode" major-mode)
    (bury-buffer))
  (let ((buffers (cdr (buffer-list))))
    (while buffers
      (when (with-current-buffer (car buffers) (string= "term-mode" major-mode))
        (switch-to-buffer (car buffers))
        (setq buffers nil))
      (setq buffers (cdr buffers)))))
(global-set-key (kbd "<f3>") 'my-term-cycle)

;; add it so it runs for term-mode
(require 'term)
(add-hook 'term-mode-hook (lambda ()
                            (define-key term-raw-map "\C-y" 'my-term-yank)))


(provide 'term-conf)

;;; term-conf.el ends here
