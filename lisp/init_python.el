(require 'package)

;; 使用python3
;; (setq elpy-rpc-python-command "/usr/local/bin/python3")
(setq python-shell-interpreter "/usr/local/bin/python3")
(setq python-shell-completion-native-enable nil)
(setq py-python-command "/usr/local/bin/python3")
(setq exec-path (append exec-path '("/usr/local/bin")))

;; 使用jedi自动补全
;; (use-package jedi
;;   :ensure t
;;   :init
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (setq jedi:get-in-function-call-delay 0)
;;   (setq jedi:complete-on-dot t)
;;   (setq jedi:environment-root "jedi")  ; or any other name you like
;;   (setq jedi:environment-virtualenv
;;       (append python-environment-virtualenv
;;               '("--python" "/usr/local/bin/python3"))))


;; 启用elpy的python开发环境
;; (use-package elpy
;;   :ensure t
;;   :config
;;   (progn
;;     (elpy-enable)
;;     (local-set-key (kbd "C-h") nil)
;;     (local-set-key (kbd "M-.") 'elpy-goto-definition-other-window)))

;; 设置flycheck的python检查器
;; (add-hook 'python-mode-hook fly

(provide 'init_python)
;;; init_python ends here
