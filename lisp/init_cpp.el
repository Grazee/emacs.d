;; (require 'package)

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

(provide 'init_cpp)
