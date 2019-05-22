;; Mac 使用Option作为meta
(setq mac-option-key-is-meta t
      mac-command-key-is-meta nil
      mac-command-modifier 'none
      mac-option-modifier 'meta)

;; C-h 变成删除键
(global-set-key "\C-h" 'delete-backward-char)

;; C-x h 变成文档键
(global-set-key "\C-xh" 'help-command)

;; C-t 上翻页
;;(global-set-key "\C-t" 'scroll-down)

;; C-w 向前删除一个单词
;;(global-set-key (kbd "C-w") 'backward-kill-word)

(provide 'init_key)
