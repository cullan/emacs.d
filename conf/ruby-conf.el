;;; ruby-conf.el --- Configuration related to Ruby programming

;;; Commentary:
;; Add packages for Ruby
;; mostly copied from
;; https://github.com/howardabrams/dot-files/blob/master/emacs-ruby.org

;;; Code:

;; associate ruby-mode with proper files
(use-package ruby-mode
  :ensure t
  :mode "\\.rb\\'"
  :mode "Rakefile\\'"
  :mode "Gemfile\\'"
  :mode "Berksfile\\'"
  :mode "Vagrantfile\\'"
  :mode ".irbrc\\'"
  :interpreter "ruby"

  :init
  (setq ruby-indent-level 2
        ruby-indent-tabs-mode nil)
  (add-hook 'ruby-mode 'superword-mode)

  :bind
  (([(meta down)] . ruby-forward-sexp)
   ([(meta up)]   . ruby-backward-sexp)
   (("C-c C-e"    . ruby-send-region))))


;; paredit-lite
(use-package smartparens
  :ensure t
  :diminish (smartparens-mode .  "()")
  :init
    (use-package smartparens-ruby)
    (add-hook 'ruby-mode-hook 'smartparens-strict-mode))

;; irb (ruby shell)
(defun inf-ruby-handle-close ()
  "Automatically close the buffer when the console exits."
  (when (ignore-errors (get-buffer-process (current-buffer)))
    (set-process-sentinel (get-buffer-process (current-buffer))
                          (lambda (proc change)
                            (when (string-match "\\(finished\\)" change)
                              (kill-buffer (process-buffer proc)))))))

(use-package inf-ruby
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
  (add-hook 'inf-ruby-mode-hook 'inf-ruby-handle-close))



;; linter for Ruby
;; needs to be installed with `gem install rubocop`
(use-package rubocop
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'rubocop-mode)
  :diminish rubocop-mode)

;; view docs with F1
(use-package yari
  :ensure t
  :init
  (add-hook 'ruby-mode-hook
            (lambda ()
              (local-set-key [f1] 'yari))))

(provide 'ruby-conf)
;;; ruby-conf.el ends here
