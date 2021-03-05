;;; org-conf.el --- Configure org-mode.

;;; Commentary:
;; Org mode is for outlines, task tracking, etc.

;;; Code:

(declare-function org-get-tags "ext:org-mode.el")

(defun tag-match-at-point ()
  "Make a search string to match any of the tags for the headline at point."
  (let ((tags (org-get-tags nil t)))
    (string-join tags "|")))

(use-package org
  :ensure t
  :custom
  (org-directory "~/Documents/org/")
  (org-agenda-files '("~/Documents/org/agenda"))
  (org-agenda-custom-commands
   '(("r" "Headlines that share a tag with headline at point" tags (tag-match-at-point))))
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c l" . org-link)
   ("C-c i" . org-clock-in)
   ("C-c o" . org-clock-out)))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/Documents/org/notes/")
  :hook
  (after-init . org-roam-mode)
  :bind (:map org-roam-mode-map
              ("C-c n l" . org-roam)
              ("C-c n f" . org-roam-find-file)
              ("C-c n j" . org-roam-jump-to-index)
              ("C-c n b" . org-roam-switch-to-buffer)
              ("C-c n g" . org-roam-graph)
         :map org-mode-map
              ("C-c n i" . org-roam-insert)))

(use-package ob-elixir
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (elixir . t))))

(provide 'org-conf)

;;; org-conf.el ends here
