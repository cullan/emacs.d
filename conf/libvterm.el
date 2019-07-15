;;; libvterm.el --- libvterm

;;; Commentary:
;; Exciting prospect of a real term inside Emacs.

;;; Code:

(defvar vterm-user "")
(make-variable-buffer-local 'vterm-user)
(defvar vterm-host "")
(make-variable-buffer-local 'vterm-host)
(defvar vterm-pwd "")
(make-variable-buffer-local 'vterm-pwd)
(defvar vterm-cmd "")
(make-variable-buffer-local 'vterm-cmd)

(defun vterm--set-title-hook (title)
  "Use the title in the shell prompt to set the buffer title.
TITLE = user@host@lastcmd path  or user@host path"
  (let* ((tokens (split-string title ":" ))
         dir)
    (when (equal 2 (length tokens))
      (setq vterm-pwd (string-trim-left (nth 1 tokens)))
      (setq tokens (split-string (nth 0 tokens) "@" ))
      (when (>  (length tokens) 1)
        (setq vterm-user (nth 0 tokens))
        (setq vterm-host (nth 1 tokens))
        (when (and (nth 2 tokens)
                   (not (string-empty-p (or (nth 2 tokens) ""))))
          (setq vterm-cmd (nth 2 tokens))))
      (setq dir
            (file-name-as-directory
             (if (and (string= vterm-host (system-name))
                      (string= vterm-user (user-real-login-name)))
                 (expand-file-name vterm-pwd)
               (concat "/-:" vterm-user "@" vterm-host ":"
                       vterm-pwd))))
      (when (ignore-errors (file-directory-p dir))
        (cd-absolute dir))
      (rename-buffer (format "term %s" vterm-pwd) t))))

(defun vterm--exit-hook (buf)
  "Kill the buffer after the vterm exits.
BUF = the buffer the vterm is in"
  (when buf (kill-buffer buf)))

(use-package vterm
  :ensure t
  :init
  (setq vterm-shell "/usr/local/bin/fish")
  (add-hook 'vterm-exit-functions 'vterm--exit-hook)
  (add-hook 'vterm-set-title-functions 'vterm--set-title-hook))

(provide 'libvterm)

;;; libvterm.el ends here
