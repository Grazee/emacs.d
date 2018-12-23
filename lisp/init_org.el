;;(require 'package)
(require 'org)

;; 中文与英文字体设置
;; 英文字体
(set-face-attribute'default nil :font "Menlo 14")
;; 中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "Pingfang SC" :size 16)))

;; 捕获
;; 设置默认文件地址
(setq org-directory "/User/wc/Documents/org/")
(setq org-default-notes-file (concat org-directory "notes.org"))
;; 全局快捷键
(define-key global-map "\C-cc" 'org-capture)

;; 粘贴图片
(defun wc-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the same directory as the org-buffer and insert a link to this file."
  (interactive)
  (org-display-inline-images)

  ;; 存在和org文件同目录下一个文件夹
  ;; (setq filename
  ;;       (concat
  ;;        (make-temp-name
  ;;         (concat (file-name-nondirectory (buffer-file-name))
  ;;                 "_imgs/"
  ;;                 (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))

  ;; 存在统一的文件夹~/org/cache/image
  (setq filename
	(concat
	 (make-temp-name
  	  (concat (getenv "HOME")
		  "/org/cache/image/"
  		  (file-name-nondirectory buffer-file-name)
  		  (format-time-string "%Y%m%d_%H%M%S_")))
  		  ".png"))
  
  (unless (file-exists-p (file-name-directory filename))
    (make-directory (file-name-directory filename)))
  ; take screenshot
  (if (eq system-type 'darwin)
      (call-process "screencapture" nil nil nil "-i" filename))
  (if (eq system-type 'gnu/linux)
      (call-process "import" nil nil nil filename))
  ; insert into file if correctly taken
  (if (file-exists-p filename)
      (progn
	(insert (concat "[[file:" filename "]]"))
	(org-display-inline-images))))

(image-type-available-p 'imagemagick)

;; 优化org模式显示，比如点点
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; 更改导出pdf的引擎为Xe LaTex
(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                              "xelatex -interaction nonstopmode %f"))

;; 导出pdf的一个模板
(require 'ox-latex)
(add-to-list 'org-latex-classes
		  '("wc-article"
		    "\\documentclass{article}
                     \\usepackage{xeCJK}   %支持中文
                     \\usepackage[unicode=true,colorlinks=no,pdfborder=no]{hyperref}   % 不要红色边框
                     [NO-DEFAULT-PACKAGES]
                     [PACKAGES]
                     [EXTRA]"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;;;一些设置
;; 自动换行
(add-hook 'org-mode-hook 'toggle-truncate-lines)
;; 自动缩进（有点bug）
;;(setq org-startup-indented t)
;;(setq org-indent-mode t)
;; 图文混编
(setq org-startup-with-inline-images t)
(setq org-image-actual-width nil)
(add-hook 'org-mode-hook 'org-display-inline-images)

(setq visual-line-mode t)

(provide 'init_org)
