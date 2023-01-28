(require 'package)
(require 'init_profile)

(use-package solidity-mode
  :ensure t)

(use-package company-solidity
  :ensure t
  :config
  (add-hook 'solidity-mode-hook
	(lambda ()
	(set (make-local-variable 'company-backends)
		(append '((company-solidity company-capf company-dabbrev-code))
			company-backends)))))

(provide 'init_solidity)
