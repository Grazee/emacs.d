;; C-h 变成删除键
(global-set-key "\C-h" 'delete-backward-char)

;; C-x h 变成文档键
(global-set-key "\C-xh" 'help-command)

;; C-v 可以移到文件末尾
(setq scroll-error-top-bottom 'true)

;; C-y 上翻页
(global-set-key "\C-y" 'backward-page)

;; C-w 向前删除一个单词
(global-set-key (kbd "C-w") 'backward-kill-word)

(provide 'init_key)
