(require 'package)

(use-package omnisharp
  :ensure t
  :init
  (add-to-list 'company-backends 'company-omnisharp)
  :hook
  (progn
    (csharp-mode . omnisharp-mode)
    (csharp-mode . company-mode)
    (csharp-mode . electric-pair-mode)))

(provide 'init_csharp)
