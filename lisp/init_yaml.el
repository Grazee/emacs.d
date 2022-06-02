(require 'package)

(use-package yaml-mode
  :ensure t
  :mode
  (("\\.yml\\'" . yaml-mode)
   ("\\.yaml\\'" . yaml-mode)))

(provide 'init_yaml)
