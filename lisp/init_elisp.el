;; 不自动补全单引号
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; 高亮两边的括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(provide 'init_elisp)
;;; init_elisp.el ends here
