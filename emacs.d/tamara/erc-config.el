(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-kill-buffer-on-part t)
(setq erc-kill-queries-on-quit t)

(global-set-key "\C-c\C-ef" (lambda () (interactive)
                           (erc :server "irc.freenode.net" :port "6667"
                                :nick "pontiki" :password "nitwood"
                                :full-name "Tamara Temple <tamouse@gmail.com>")))
