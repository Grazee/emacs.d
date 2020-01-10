(require 'package)
(require 'init_profile)

;; (use-package typescript-mode
;;   :ensure t)

;; 用于TypeScript的开发环境
(use-package tide
  :ensure t
  :config
  (progn
    (setq tide-project-root typescript-project-root)
    (tide-start-server)
    (tide-setup))
  :hook
  (typescript-mode . tide-mode))

(provide 'init_typescript)
