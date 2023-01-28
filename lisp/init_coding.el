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
    (solidity-mode . company-mode)))

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

(use-package validate
  :ensure t)

;; ECB 开发环境
;; (use-package ecb
;;   :ensure t
;;   :config
;;   (setq    
;;    ;; 使用自定义布局
;;    ecb-layout-name "wc-layout"

;;    ;; 通用配置
;;    ;; ecb-auto-activate t
;;    ecb-version-check nil
;;    ecb-tip-of-the-day nil
;;    ecb-auto-compatibility-check nil

;;    ;; 树状图配置
;;    ;; ecb-tree-buffer-style '

;;    ;; directories窗口设置
;;    ecb-show-sources-in-directories-buffer 'always
;;    ecb-auto-expand-directory-tree 'best
;;    ecb-windows-width 0.2

;;    ;; methods窗口设置
;;    ecb-auto-expand-tag-tree 'all
;;    ;; ecb-auto-update-methods-after-save t
;;    ecb-highlight-tag-with-point 'highlight-scroll)
;;   :bind
;;   ("C-1" . 'ecb-goto-window-directories)
;;   ("C-2" . 'ecb-goto-window-methods)
;;   ("C-3" . 'ecb-goto-window-edit-by-smart-selection))

;; (defvar ecb-running nil)
;; (defun switch-ecb ()
;;   (interactive)
;;   (if ecb-running
;;       (progn
;;         (ecb-deactivate)
;;         (setq ecb-running nil))
;;     (progn
;;       (ecb-activate)
;;       (setq ecb-running t))))

;; (global-set-key (kbd "M-0") 'switch-ecb)

;; 自定义ECB布局
;; (ecb-layout-define "wc-layout" left nil
;;                    ;; The frame is already splitted side-by-side and point stays in the
;;                    ;; left window (= the ECB-tree-window-column)
                   
;;                    ;; Here is the creation code for the new layout
;;                    ;; 1. Defining the current window/buffer as ECB-methods buffer
;;                    (ecb-set-directories-buffer)
;;                    ;; 2. Splitting the ECB-tree-windows-column in two windows
;;                    (ecb-split-ver 0.6 t)
;;                    ;; 3. Go to the second window
;;                    (other-window 1)
;;                    ;; 4. Defining the current window/buffer as ECB-history buffer
;;                    (ecb-set-methods-buffer)
;;                    ;; 5. Make the ECB-edit-window current (see Postcondition above)
;;                    (select-window (next-window)))

;; Git工具
(use-package magit
  :ensure t)

;; WakaTime敲代码时间统计工具
;; (use-package wakatime-mode
;;   :ensure t
;;   :config
;;   (progn
;;     ;; (custom-set-variables )
;;     (custom-set-variables '(wakatime-api-key key-wakatime))
;;     (global-wakatime-mode)))

(provide 'init_coding)
