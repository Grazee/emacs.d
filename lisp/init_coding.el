(require 'package)
(require 'init_profile)

;; 关闭自动缩进
(set (make-local-variable 'electric-indent-mode) nil)

;; 多行注释
(global-set-key (kbd "M-/") 'comment-line)

;; 括号高亮
(show-paren-mode)

;; 缩进宽度
(setq-default
 tab-width 4
 standard-indent 4
 indent-tabs-mode nil)	

;; 代码块补全
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

;; 代码检查
(use-package flycheck
  :ensure t
  :config
  (setq flycheck-clang-language-standard "c++14"
        flycheck-gcc-language-standard "c++14")
  :hook
  (progn
    ;; (python-mode . flycheck-mode)
    (c++-mode . flycheck-mode)
    (go-mode . flycheck-mode)
    (lua-mode . flycheck-mode)
    ;; (java-mode . flycheck-mode)
    (typescript-mode . flycheck-mode)))

;; Company自动补全
(use-package company
  :ensure t
  :config  
  (setq
   ;; 忽略大小写
   completion-ignore-case t
   ;; 补全延迟（不要延迟）
   company-idle-delay 0
   ;; 根据使用频次排序
   company-transformers '(company-sort-by-occurrence)
   ;; 输入多少个符号开启补全
   company-minimum-prefix-length 1
   ;; 菜单可循环
   company-selection-wrap-around t)
  :hook
  (progn
    (emacs-lisp-mode . company-mode)
    (c++-mode . company-mode)
    (makefile-mode . company-mode)
    (lua-mode . company-mode)
    (typescript-mode . company-mode)
    ;; (java-mode . company-mode)
    ;; (go-mode . company-mode)
    (c-mode . company-mode)
    (js-mode . company-mode)
    (solidity-mode . company-mode)))

;; 使用M-n和M-p来选择补全
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-h") nil)
  (define-key company-active-map (kbd "M-n") #'company-select-next)
  (define-key company-active-map (kbd "M-p") #'company-select-previous))

(use-package validate
  :ensure t)

;; Git工具
;; (use-package magit
;;   :ensure t)

(use-package jenkinsfile-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package lsp-mode
  :ensure t
  :config
  (setq
   lsp-idle-delay 0
   lsp-pylsp-plugins-pycodestyle-enabled nil
   lsp-pylsp-plugins-autopep8-enabled nil
   lsp-pylsp-plugins-flake8-enabled nil
   lsp-diagnostics-provider :none)
  (lsp-register-custom-settings
   '(("pyls.plugins.pyls_mypy.enabled" t t)
     ("pyls.plugins.pyls_mypy.live_mode" nil t)
     ("pyls.plugins.pyls_black.enabled" t t)
     ("pyls.plugins.pyls_isort.enabled" t t)
     ("pyls.plugins.flake8.enabled" nil t)))
  :hook
  ((python-mode . lsp)
   (go-mode . lsp)))

;; 代码补全后端
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq
   lsp-ui-sideline-show-hover t
   lsp-ui-sideline-delay 0
   lsp-ui-doc-delay 5
   lsp-ui-sideline-ignore-duplicates t
   lsp-ui-doc-position 'bottom
   lsp-ui-doc-alignment 'frame
   lsp-ui-doc-header nil
   lsp-ui-doc-include-signature t
   lsp-ui-doc-use-childframe t))

;; 使用github copilot
(use-package copilot
  :quelpa (copilot :fetcher github
                   :repo "zerolfx/copilot.el"
                   :branch "main"
                   :files ("dist" "*.el")))

(provide 'init_coding)
