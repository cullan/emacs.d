;;; emacs-settings.el --- General settings to configure Emacs

;;; Commentary:
;; Set various configuration settings.

;;; Code:

;; turn off menu bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; display multi-line help text in the echo area instead of tooltip
(tooltip-mode nil)

;; hide the startup message
(setq inhibit-startup-message t)

;; kill-word instead of backspace
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; save autosave and backups in one place
;;     *not* scattered all over the file system! (FFS)
(defvar autosave-dir "~/.emacs.d/autosaves/")

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  "Is the file (as FILENAME) an autosave file?"
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  "Create the auto-save file name."
  (concat autosave-dir
          (if buffer-file-name
              (concat "#" (file-name-nondirectory buffer-file-name) "#")
            (expand-file-name
             (concat "#%" (buffer-name) "#")))))

;; The backup-directory-alist list contains regexp=>directory
;; mappings. filenames matching a regexp are backed up in the
;; corresponding directory. Emacs will mkdir if necessary.
(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))

;; banish tabs to oblivion
(setq-default indent-tabs-mode nil)

;; tabifying when I align-regexp is also very, very lame. use only spaces
(defadvice align-regexp (around align-regexp-with-spaces)
  "Never use tabs for alignment."
  (let ((indent-tabs-mode nil))
    ad-do-it))
(ad-activate 'align-regexp)

;; untabify the whole buffer
(defun untabify-buffer ()
  "Untabify current buffer."
  (interactive)
  (untabify (point-min) (point-max)))

;; align-regexp is rad, it should have a key
(global-set-key (kbd "C-c r") 'align-regexp)

;; always end a file with a newline
(setq require-final-newline t)

;; use y or n instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; show column number
(setq column-number-mode t)

;; show parens
(show-paren-mode 1)

;; automatically reload buffers when the file changes on disk
(global-auto-revert-mode t)

(provide 'emacs-settings)

;;; emacs-conf.el ends here
