;; 用y和n代替yes和no
(defalias 'yes-or-no-p 'y-or-n-p)

;; 打印详细的错误信息
(setq debug-on-error t)

;; 不产生备份文件
(setq make-backup-files nil)
;; 不自动保存文件
(setq auto-save-default nil)

;; 关掉emacs欢迎页
(setq inhibit-startup-message t)

;; 高亮当前光标行
(global-hl-line-mode t)

;; Dired Mode下不打开新的缓冲区
(put 'dired-find-alternate-file 'disabled nil)
;; 延迟加载Dired Mode
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 启动时显示最近打开的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

(provide 'init_setting)
