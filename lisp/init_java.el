(require 'package)

;; 设置JAVA的环境变量
(setenv "JAVA_HOME" "/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home")
;; (exec-path-from-shell-copy-env "JAVA_HOME")
;; (exec-path-from-shell-copy-env "PATH")
;; (exec-path-from-shell-copy-env "CLASSPATH")

;; (use-package lsp-mode
;;   :ensure t)

;; (use-package lsp-java
;;   :ensure t)

;; (use-package company-lsp
;;   :config
;;   (setq yas-minor-mode t)
;;   :ensure t)

;; (add-hook
;;  'java-mode-hook
;;  (setq-default default-tab-width 2
;;                tab-width 2))

;; (use-package dap-mode
;;   :ensure t)

;; (add-hook
;;  'java-mode-hook
;;  'lsp)

;; (add-hook
;;  'java-mode-hook
;;  'electric-pair-mode)

(provide 'init_java)
