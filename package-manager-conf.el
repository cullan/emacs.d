;;; package-manager-conf.el --- Configure package management

;;; Commentary:
;; Set up use-package and configure repositories.

;;; Code:

(require 'package)

;; do not edit my init file to run package-initialize
(setq package--init-file-ensured t)

(setq package-enable-at-startup nil)
(setq debug-on-error t)
(setq package-archives '())
(setq package-archives
      (append (symbol-value 'package-archives)
              '(("melpa" . "https://melpa.org/packages/")
                ("gnu" . "http://elpa.gnu.org/packages/")
                ("elpy" . "http://jorgenschaefer.github.io/packages/")
                ("org" . "https://orgmode.org/elpa/"))))

; (package-initialize)

;; use-package installs and configures the other packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'package-manager-conf)

;;; package-manager-conf.el ends here
