;;; work-timer.el --- Remind the user to take a break.

;;; Commentary:
;; Sends a notification after the specified time using lib-notify.

;;; Code:

(defun notify-via-libnotify (title body)
  "Notify with TITLE, BODY via `libnotify'."
  (call-process
   "notify-send" nil 0 nil
   title body
   "-t" (number-to-string 5000) ; timeout
   "-i" "emacs"                 ; icon
   "-u" "low"                   ; priority
   "-c" "emacs.message"         ; category
   ))

(defun work-timer-notify-take-a-break ()
  "Notify the user that it is time for a break."
  (notify-via-libnotify
   "Take a break"           ; message title
   "Don't try to be a hero" ; message body
   ))

(defun work-timer-set-timer ()
  "Set a timer to send the break notification after the specified interval."
  (interactive)
  (run-at-time
   (format
    "%s min"
    (read-from-minibuffer
     "Break in how many minutes? "))
   nil
   'work-timer-notify-take-a-break))

(provide 'work-timer)

;;; work-timer.el ends here
