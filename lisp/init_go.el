(require 'package)
(require 'init_profile)

;; 保存代码前进行格式化
;; (add-hook 'before-save-hook 'gofmt-before-save)

;; 设置路径变量
(setenv "GOPATH" gopath)
(setenv "PATH" (concat (getenv "PATH")
                       (concat ":"
                               (concat gopath "/bin"))))
;; (add-to-list 'exec-path (expand-file-name (concat gopath "/bin/godef")))

(use-package go-mode
  :ensure t
  :init
  (progn
    (setq gofmt-command "goimports")
    (setq godef-command (concatenate 'string gopath "/bin/godef"))
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
(use-package company-go
  :ensure t
  :config
  (progn
    ;; 设置二进制文件地址
    (setq company-go-gocode-command (concatenate 'string gopath "/bin/gocode"))
    (add-hook 'go-mode-hook
              (lambda ()
                (set (make-local-variable 'company-backends) '(company-go))
                (company-mode)))))
    ;; (defun inkel/company-go-hook ()
    ;;   (set (make-local-variable 'company-backends) '(company-go))
    ;;   (company-mode t))
    ;; (add-hook 'go-mode-hook 'inkel/company-go-hook)))

;; 查找函数的调用
(use-package go-guru
  :ensure t
  :hook
  (go-mode . go-guru-hl-identifier-mode))

(use-package go-imports
  :ensure t
  :bind
  ("C-c i" . 'go-goto-imports))
;; 按键设定
;; (add-hook 'go-mode-hook (lambda ()
;;                           (local-set-key (kbd "C-c i") 'go-goto-imports)))

(provide 'init_go)
