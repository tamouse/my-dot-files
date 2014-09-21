(menu-bar-mode t)
(global-linum-mode t)
(color-theme-initialize)
(color-theme-charcoal-black)
(setq user-mail-address "tamouse@gmail.com")
(setq user-organization "Tamara Temple Web Development")
(setq user-home-page    "http://blog.tamouse.org")
(load "time-stamp")
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-active t)
(electric-pair-mode t)
(setq org-default-notes-file (expand-file-name "~/Dropbox/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq fill-column 80)

(setq ruby-deep-indent-paren nil)       ; make indents in ruby more normal, a la
                                        ; sublime 

(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

(yas-global-mode 1)
(add-to-list 'yas-snippet-dirs (expand-file-name "~/.emacs.d/tamara/snippets"))
(yas-reload-all)

;;;;(require 'chruby)
;;;;(chruby "2.0.0")

(server-start)
(edit-server-start)
