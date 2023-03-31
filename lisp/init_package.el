(require 'package)
;;(require 'use-package)

(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'quelpa-use-package))

;; 不用安装也可以使用包，尝试一下
(use-package try
         :ensure t)

(provide 'init_package)
