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
(let ((default-directory "~/.config/emacs/")
      (autosave-dir (expand-file-name "autosaves"))
      (backup-dir (expand-file-name "backups")))
  (make-directory autosave-dir t)
  (setq backup-directory-alist (list (cons "." backup-dir)))
  `(defun make-auto-save-file-name ()
     "Create the auto-save file name."
     (concat ',autosave-dir
             (if buffer-file-name
                 (concat "#" (file-name-nondirectory buffer-file-name) "#")
               (expand-file-name
                (concat "#%" (buffer-name) "#"))))))

(defun auto-save-file-name-p (filename)
  "Is the file (as FILENAME) an autosave file?"
  (string-match "^#.*#$" (file-name-nondirectory filename)))

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

;; use hex to specify the char to insert with C-q
(setq read-quoted-char-radix 16)

;; mac os maps menu key to C-p for some reason
;; I made the menu button F13 with Karabiner
(define-key key-translation-map (kbd "<f13>") (kbd "<menu>"))

;; default to finding files in the home directory
(setq default-directory (concat (getenv "HOME") "/"))

;; add homebrew to path
(when (string-equal system-type "darwin")
  (progn (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
         (setq exec-path (append exec-path '("/usr/local/bin")))))

(provide 'emacs-settings)

;;; emacs-conf.el ends here
