(use-package pdf-tools
  :ensure t
  :config
  ;; Initialize the pdf-tools package
  (pdf-tools-install)
  ;; Automatically open PDFs in pdf-view-mode
  ;; TODO in doc-view-mode if the file extenstion is only .pdf
  ;; automatically enable pdf-view-mode  
  :hook((doc-view-mode . pdf-view-mode)
	(pdf-view-mode . pdf-sync-minor-mode)
	;; enable pdf-tools-enable-minor-mode in pdf-view-mode
	))

(provide 'setup-pdf)
