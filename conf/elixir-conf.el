;;; elixir-conf.el --- Configuration for elixir-mode

;;; Commentary:
;; 

;;; Code:

(use-package elixir-mode
  :ensure t
  :after projectile yasnippet
  :init
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
  (add-hook 'elixir-format-hook
            (lambda ()
              (if (projectile-project-p)
                  (setq elixir-format-arguments
                        (list "--dot-formatter"
                              (concat
                               (locate-dominating-file
                                buffer-file-name
                                ".formatter.exs")
                               ".formatter.exs")))
                (setq elixir-format-arguments nil)))))

(use-package alchemist
  :ensure t)

(provide 'elixir-conf)

;;; elixir-conf.el ends here
