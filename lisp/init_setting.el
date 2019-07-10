;; 设置环境变量
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 隐藏滑动条
(scroll-bar-mode -1)

;; 用y和n代替yes和no
(defalias 'yes-or-no-p 'y-or-n-p)

;; 打印详细的错误信息
(setq debug-on-error nil)

;; 不产生备份文件
(setq make-backup-files nil)
;; 不自动保存文件
(setq auto-save-default nil)

;; 关掉emacs欢迎页
(setq inhibit-startup-message t)

;; 使用C-v和C-t可以移动到文件头尾
(setq scroll-error-top-bottom t)


;; Dired Mode
;; Dired Mode下不打开新的缓冲区
(put 'dired-find-alternate-file 'disabled nil)
;; 延迟加载Dired Mode
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 启动时显示最近打开的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 不要工具栏
(tool-bar-mode -1)

(provide 'init_setting)
