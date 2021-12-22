(require 'package)
(require 'init_profile)

(use-package exec-path-from-shell
  :ensure t
  :init
  (progn
    (exec-path-from-shell-copy-env "PATH")
    (exec-path-from-shell-copy-env "GOPATH")))
  

(use-package go-mode
  :ensure t
  :init
  (progn
    (setq gofmt-command "goimports")
    (setq godef-command (concat gopath "/bin/godef"))
    (add-hook 'before-save-hook 'gofmt-before-save))
    ;; (bind-key [remap find-tag] #'godef-jump))
  :config
  (add-hook 'go-mode-hook 'electric-pair-mode))
  ;; 查看函数定义
  ;; (use-package go-eldoc
  ;;   :ensure t
  ;;   :config
  ;;   (go-eldoc-setup)))

;; go的补全
(use-package lsp-ui
  :ensure t)
(use-package lsp-mode
  :ensure t
  :config
  (progn
    (add-hook 'go-mode-hook #'lsp-deferred)
    (add-hook 'go-mode-hook #'yas-minor-mode)))

(provide 'init_go)
