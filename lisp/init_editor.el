(require 'package)

;; 显示行号
;; (global-linum-mode t)

;开启 whitespace-mode 对制表符和行为空格高亮，很丑
;; (whitespace-mode t)

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

;; 多光标编辑模式
(use-package multiple-cursors
  :ensure t
  :config
  (progn
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)))

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

;; M-x增强版
(use-package smex
  :ensure t
  :config
  (progn
    (global-set-key (kbd "M-x") 'smex)
    (global-set-key (kbd "M-X") 'smex-major-mode-commands)
    ;; This is your old M-x.
    (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
    (defun smex-prepare-ido-bindings ()
      (define-key ido-completion-map (kbd "TAB") #'minibuffer-complete)
      (define-key ido-completion-map (kbd "M-p") #'previous-history-element)
      (define-key ido-completion-map (kbd "M-.") #'smex-find-function)
      (define-key ido-completion-map (kbd "C-h") #'delete-backward-char)
      (define-key ido-completion-map (kbd "C-a") #'move-beginning-of-line))))
    

;; 左侧文件导航
;; (use-package treemacs
;;   :ensure t
;;   :defer t
;;   :init
;;   (with-eval-after-load 'winum
;;     (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
;;   :config
;;   (progn
;;     (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
;;           treemacs-deferred-git-apply-delay      0.5
;;           treemacs-display-in-side-window        t
;;           treemacs-eldoc-display                 t
;;           treemacs-file-event-delay              5000
;;           treemacs-file-follow-delay             0.2
;;           treemacs-follow-after-init             t
;;           treemacs-git-command-pipe              ""
;;           treemacs-goto-tag-strategy             'refetch-index
;;           treemacs-indentation                   2
;;           treemacs-indentation-string            " "
;;           treemacs-is-never-other-window         nil
;;           treemacs-max-git-entries               5000
;;           treemacs-missing-project-action        'ask
;;           treemacs-no-png-images                 1
;;           treemacs-no-delete-other-windows       t
;;           treemacs-project-follow-cleanup        nil
;;           treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
;;           treemacs-position                      'left
;;           treemacs-recenter-distance             0.1
;;           treemacs-recenter-after-file-follow    nil
;;           treemacs-recenter-after-tag-follow     nil
;;           treemacs-recenter-after-project-jump   'always
;;           treemacs-recenter-after-project-expand 'on-distance
;;           treemacs-show-cursor                   nil
;;           treemacs-show-hidden-files             t
;;           treemacs-silent-filewatch              nil
;;           treemacs-silent-refresh                nil
;;           treemacs-sorting                       'alphabetic-desc
;;           treemacs-space-between-root-nodes      t
;;           treemacs-tag-follow-cleanup            t
;;           treemacs-tag-follow-delay              1.5
;;           treemacs-width                         35)

;;     ;; The default width and height of the icons is 22 pixels. If you are
;;     ;; using a Hi-DPI display, uncomment this to double the icon size.
;;     ;;(treemacs-resize-icons 44)

;;     (treemacs-follow-mode t)
;;     (treemacs-filewatch-mode t)
;;     (treemacs-fringe-indicator-mode t)
;;     (pcase (cons (not (null (executable-find "git")))
;;                  (not (null treemacs-python-executable)))
;;       (`(t . t)
;;        (treemacs-git-mode 'deferred))
;;       (`(t . _)
;;        (treemacs-git-mode 'simple))))
;;   :bind
;;   (:map global-map
;;         ("M-0"       . treemacs)))
;;         ;; ("C-x t 1"   . treemacs-delete-other-windows)
;;         ;; ("C-x t t"   . treemacs)
;;         ;; ("C-x t B"   . treemacs-bookmark)
;;         ;; ("C-x t C-t" . treemacs-find-file)
;;         ;; ("C-x t M-t" . treemacs-find-tag)))

;; (use-package treemacs-evil
;;   :after treemacs evil
;;   :ensure t)

;; (use-package treemacs-projectile
;;   :after treemacs projectile
;;   :ensure t)

;; (use-package treemacs-icons-dired
;;   :after treemacs dired
;;   :ensure t
;;   :config (treemacs-icons-dired-mode))

;; (use-package treemacs-magit
;;   :after treemacs magit
;;   :ensure t)


(provide 'init_editor)
