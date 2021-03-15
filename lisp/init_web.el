(require 'package)

(use-package web-mode
  :ensure t
  :init
  (electric-pair-mode t)
  :hook
  (web-mode . company-mode)
  (less-css-mode . company-mode))

(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))

(provide 'init_web)
