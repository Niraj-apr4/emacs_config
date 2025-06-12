
;; setup-windows.el


(setq display-buffer-alist
      '(
	;; Anatomy of entry
	;; (BUFFER-MATCHER
	;; LIST-OF-DISPLAY-FUNCTIONS
	;; &optional PARAMATERS)

	((and  "\\*julia\\* error"
	 (derived-mode . compilation-mode))
	 ;; list of display function
	 (display-buffer-below-selected)
	 ;; parameters
	 (window-height . 0.35)
	 )

	("\\*julia\\*" 
	 ;; list of display function
	 (display-buffer-reuse-mode-window
	  display-buffer-in-side-window)
	 ;; parameters
	 (side . right)
	 (window-width . 0.45)
	 )

	("\\*python\\*" 
	 ;; list of display function
	 (display-buffer-reuse-mode-window
	  display-buffer-in-side-window)
	 ;; parameters
	 (side . right)
	 (window-width . 0.45)
	 )


	))

(provide 'setup-windows)
