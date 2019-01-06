;;; init.el --- Initialization file

;;; Commentary:
;; Configure Emacs.

;;; Code:

(add-to-list 'load-path "~/.emacs.d/src/")
(setq custom-file "~/.emacs.d/conf/custom.el") ; custom variables

(defun load-conf-files ()
  "Load each of the specified configuration files."
  (let ((base-dir "~/.emacs.d/conf/")
        (files '("emacs" "package-manager" "theme" "font"
                 "whitespace" "winum" "yasnippet" "org"
                 "term" "company" "flycheck" "shell-path"
                 "paredit" "helm" "magit" "projectile" "elixir" "ruby"
                 "web" "elpy" "clojure" "golang" "slime" "work-timer")))
    (dolist (file files)
      (load (concat base-dir file "-conf.el")))))

(load-conf-files)

(load custom-file)

(provide 'init)

;;; init.el ends here
