(require 'package)

;; 关闭自动缩进
(set (make-local-variable 'electric-indent-mode) nil)

;; 代码检查
(use-package flycheck
  :ensure t
  :hook
  (progn
    (python-mode . flycheck-mode)
    (c++-mode . flycheck-mode)))

;; Company自动补全
(use-package company
  :ensure t
  :config
  (setq completion-ignore-case t)
  :hook
  (progn
    (emacs-lisp-mode . company-mode)
    (c++-mode . company-mode)
    (makefile-mode . company-mode)
    (c-mode . company-mode)))

;; 不要延迟
(setq company-idle-delay 0)
;; 根据使用频次排序
(setq company-transformers '(company-sort-by-occurrence))

;; 使用C-n和C-p来选择补全
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

;; 多行注释
(global-set-key (kbd "M-/") 'comment-line)

;; 括号高亮
(show-paren-mode)

(provide 'init_coding)
