(require 'package)

(if (eq system-type 'darwin)
    ;; MacOS的python3目录
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

;;启用elpy的python开发环境
(use-package elpy
  :ensure t
  :config
  (setq
   ;; 使用python3
   elpy-rpc-python-command "python3")
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(provide 'init_python)
;;; init_python ends here
