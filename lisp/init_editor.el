(require 'package)

;; 显示行号
;;(global-linum-mode t)

;; 高亮当前光标行
(global-hl-line-mode t)

;; 选中文字后输入会进行替换
(delete-selection-mode t)

;; 自动补全右括号
(use-package smartparens
  :ensure t
  :config
  (smartparens-mode t))

;; 新建窗口之后自动把光标移动过去
(use-package popwin
  :ensure t
  :config
  (popwin-mode))

;; 在minibuff显示相关的快捷键
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; 可以用数字切换窗口
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

;; 在换页的时候闪光标（容易定位）
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  ;;  (setq beacon-color "#666600")
  )

;; 一次性把所有连续的空格删掉
(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode)
  (setq hungry-delete-chars-to-skip " \t\r\f\v"))

;; 选择模式的扩展
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-u") 'er/expand-region))

;; 选中相同，比如用来修改变量名（快捷键"C-;"）
;; (use-package iedit
;;   :ensure t
;;   :config
;;   (progn
;;     (global-set-key "\C-h" 'delete-backward-char)))

;; 用swiper需要附加的一个东西
(use-package counsel
  :ensure t
  )

;; 很方便的光标移动
(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(provide 'init_editor)
