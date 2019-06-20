;; (require 'package)

;; 快速跳转到函数定义位置（自动标记tag）
(use-package ggtags
  :ensure t
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                (ggtags-mode 1))))
)

;; 配置C++模式缩进
(add-hook
 'c++-mode
 (setq-default c-default-style "linux"
               ;; tab 改为插入空格
               indent-tabs-mode nil
               ;; c c++ 缩进4个空格
               c-basic-offset 4
               default-tab-width 4))

;; 配置makefile模式缩进
(add-hook
 'makefile-mode
 (setq-default default-tab-width 4
               tab-width 4))

;; 预设代码块
(use-package yasnippet
  :ensure t
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                (ggtags-mode 1)))))

(provide 'init_cpp)
