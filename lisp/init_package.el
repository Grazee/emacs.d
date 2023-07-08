(require 'package)
;;(require 'use-package)

(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"   . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package quelpa-use-package
  :ensure t
  :config
  (setq quelpa-update-melpa-p nil))

;; 不用安装也可以使用包，尝试一下
(use-package try
         :ensure t)

(provide 'init_package)
