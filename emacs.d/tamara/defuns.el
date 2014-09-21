;; Because I like using ^x^c to save the buffer and kill the file
(defun save-buffer-kill-buffer ()
  (interactive)
  (if (and
       (buffer-file-name (current-buffer))
       (buffer-modified-p (current-buffer)))
      (save-buffer (current-buffer)))
  (kill-buffer (current-buffer)))


;;; return the time as YYYY-MM-DD HH:MM
(defun jekyll-time-string ()
  "Return the current time or given time in epoc seconds as a string used by Jekyll posts: YYYY-MM-DD HH:MM"
  (format-time-string "%Y-%m-%d %H:%M")
  )

;;; insert jekyll time string
(defun insert-jekyll-time-string ()
  "Insert the formatted Jekyll time string"
  (interactive)
  (insert (concat "date: " (jekyll-time-string)))
  )

;;; snakify
(defun snakify-text (start end)
  "Convert text to a snake-case symbol"
  (interactive "r")
  (progn
    (downcase-region start end)
    (subst-char-in-region start end ?  ?_)
    )
  )
