(define-key global-map "\C-x4q" 'save-buffers-kill-terminal)
(define-key global-map "\C-x\C-c" 'save-buffer-kill-buffer)
(define-key global-map (kbd "M-SPC") 'fixup-whitespace)
(define-key global-map "\C-x\C-o" 'delete-blank-lines)
(define-key global-map "\C-cf" 'toggle-text-mode-auto-fill)

(add-hook
 'markdown-mode-hook
 '(lambda()
    (define-key
      markdown-mode-map
      "\C-c\C-id"
      'insert-jekyll-time-string)))

