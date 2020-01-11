(require 'package)
(require 'init_profile)

;; (use-package typescript-mode
;;   :ensure t)

;; 用于TypeScript的开发环境
(use-package tide
  :ensure t
  :config
  (progn
    (setq
     tide-project-root typescript-project-root
     tide-completion-ignore-case t)
    (tide-start-server)
    (tide-setup))
  :hook
  (typescript-mode . tide-mode)
  (typescript-mode . electric-pair-mode))

(provide 'init_typescript)
