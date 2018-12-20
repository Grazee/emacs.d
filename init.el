;; 从/lisp目录下加载文件
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; 自动产生的一些配置信息
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

;; 加载各个配置
;; 常用配置
(require 'init_setting) ;; 全局变量设置相关
(require 'init_key)     ;; 快捷键
(require 'init_package) ;; 包管理相关
(require 'init_theme)   ;; 主题

;; 编辑器
(require 'init_editor)  ;; 编辑器相关，光标移动什么的
(require 'init_org)     ;; Org编辑模式

;; 代码
(require 'init_coding)
(require 'init_elisp)
(require 'init_python)
(require 'init_swift)
(require 'init_markdown)

;; 默认全屏
;;(toggle-frame-fullscreen)
