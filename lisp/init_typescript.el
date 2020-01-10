(require 'package)

;; (use-package typescript-mode
;;   :ensure t)

;; 用于TypeScript的开发环境
(use-package tide
  :ensure t
  :config
  (progn
    (tide-setup)))

(provide 'init_typescript)
