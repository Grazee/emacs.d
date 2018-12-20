(require 'package)

;; 代码检查
(use-package flycheck
  :ensure t
  :hook
  (progn
    (python-mode . flycheck-mode-hook)
    (c++-mode . flycheck-mode)
    (emacs-lisp-mode . flycheck-mode)))
;;  (flycheck-select-checker 'python-flake8))

;; Company自动补全
(use-package company
  :ensure t
  :hook
  (progn
    (python-mode . company-mode)
    (emacs-lisp-mode . company-mode)))

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
(global-set-key (kbd "M-/") 'comment-line)

(provide 'init_coding)
