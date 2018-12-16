(require 'package)

;; 代码检查
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
;;  (flycheck-select-checker 'python-flake8))

;; Company自动补全
(global-company-mode t)
;; 不要延迟
(setq company-idle-delay 0)
;; 使用C-n和C-p来选择补全
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-h") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; 自动补全
;; (use-package auto-complete
;;   :ensure t
;;   :init
;;   (progn
;;     (ac-config-default)
;;     (global-auto-complete-mode t)
;;     (local-set-key (kbd "C-h") 'delete-backward-char)))

;; 多行注释
(global-set-key (kbd "s-/") 'comment-line)

(provide 'init_coding)
