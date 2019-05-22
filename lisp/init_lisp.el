(require 'package)

(use-package slime
  :ensure t
  :config
  (progn
    (setq inferior-lisp-program "/usr/local/bin/sbcl")
    (slime-setup))
  :hook
  (lisp-mode . slime-mode))

(provide 'init_lisp)
