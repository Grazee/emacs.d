(require 'package)

;; 关闭自动缩进
(set (make-local-variable 'electric-indent-mode) nil)

;; 多行注释
(global-set-key (kbd "M-/") 'comment-line)

;; 括号高亮
(show-paren-mode)

;; 代码检查
(use-package flycheck
  :ensure t  
  :hook
  (progn
    (python-mode . flycheck-mode)
    (c++-mode . flycheck-mode)
    (go-mode . flycheck-mode)))

;; Company自动补全
(use-package company
  :ensure t
  :config  
  (setq completion-ignore-case t ;; 忽略大小写
        ;; 补全延迟（不要延迟）
        company-idle-delay 0
        ;; 根据使用频次排序
        company-transformers '(company-sort-by-occurrence)
        ;; 输入多少个符号开启补全
        company-minimum-prefix-length 1
        ;; 菜单可循环
        company-selection-wrap-around t)
  ;; :init
  ;; (global-company-mode))
  :hook
  (progn
    (emacs-lisp-mode . company-mode)
    (c++-mode . company-mode)
    (makefile-mode . company-mode)
    ;; (go-mode . company-mode)
  (c-mode . company-mode)))

;; (use-package eldoc-mode
;;   :ensure t
;;   :hook
;;   (go-mode . eldoc-mode-hook))

;; 使用M-n和M-p来选择补全
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-h") nil)
  (define-key company-active-map (kbd "M-n") #'company-select-next)
  (define-key company-active-map (kbd "M-p") #'company-select-previous))

;; 自动补全
;; (use-package auto-complete
;;   :ensure t
;;   :init
;;   (progn
;;     (ac-config-default)
;;     (global-auto-complete-mode t)
;;     (local-set-key (kbd "C-h") 'delete-backward-char)))

;; 项目管理
;; (use-package projectile
;;   :ensure t
;;   :bind
;;   ("C-c p" . projectile-command-map)
;;   :init
;;   (lambda ()
;;     (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;;     (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)))

(provide 'init_coding)
