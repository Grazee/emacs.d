(require 'package)

;; Swift语法高亮
(use-package swift-mode
  :ensure t
  :hook
  (swift-mode . swift-mode-hook))

(provide 'init_swift)
