(require 'package)

(if (eq system-type 'darwin)
    ;; MacOS的python3目录
    ;; (setq python3Dic "/usr/local/bin")
  (setq python3Dic "/usr/local/bin")
  ;; 其他Linux系统的python3目录
  (setq python3Dic "/usr/bin"))

;; python设置
(defun my-python-mode-config ()
  (setq
   ;; 缩进长度4个空格
   python-indent 4
   ;; 使用空格而不是tab进行缩进
   indent-tabs-mode nil
   ;; 如果有tab的话就解释成4个空格
   default-tab-width 4

   ;; 设置 run-python 的参数，主要是python3解释器的路径，不然默认用的是python2
   python-shell-interpreter (concat python3Dic "/python3")))

(add-hook 'python-mode-hook 'my-python-mode-config)

;;启用elpy的python开发环境，包括创建python虚拟环境
;; (use-package elpy
;;   :defer t
;;   :ensure t
;;   :config
;;   (setq
;;    ;; 使用python3
;;    elpy-rpc-python-command "python3")
;;   :init
;;   (advice-add 'python-mode :before 'elpy-enable))

;; python自动补全工具
;; (use-package company-jedi
;;   :defer t
;;   :ensure t
;;   :init
;;   (progn
;;     (setq jedi:get-in-function-call-delay 0)
;;     (add-hook 'python-mode-hook 'jedi:setup)
;;     ;; 在打出点的时候弹出补全
;;     (setq jedi:complete-on-dot t)
;;     ;; 补全的时候识别简写
;;     (setq jedi:use-shortcuts t)
;;     ;; 补全列表循环
;;     (setq company-selection-wrap-around t)
;;     ;; 虚拟环境，使用elpy的虚拟环境
;;     (setq jedi:environment-root "../elpy/rpc-venv")))

(use-package lsp-mode
  :ensure t
  :config
  (setq
   lsp-idle-delay 0
   lsp-pyls-plugins-flake8-enabled -1)
  (lsp-register-custom-settings
   '(("pyls.plugins.pyls_mypy.enabled" t t)
     ("pyls.plugins.pyls_mypy.live_mode" nil t)
     ("pyls.plugins.pyls_black.enabled" t t)
     ("pyls.plugins.pyls_isort.enabled" t t)))
  :hook
  ((python-mode . lsp)))

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

(provide 'init_python)
;;; init_python ends here
