(require 'package)

;; 优化org模式显示，比如点点
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; 自动换行
(add-hook 'org-mode-hook 'toggle-truncate-lines)

(provide 'init_org)
