;; (require 'package)

;; tab缩进为4个
(setq-default c-default-style "linux"
              ;; tab 改为插入空格
              indent-tabs-mode nil
              ;; c c++ 缩进4个空格
              c-basic-offset 4
              default-tab-width 4)

(provide 'init_cpp)
