
;; setup-windows.el

(setq display-buffer-alist
      '(
	;; Anatomy of entry
	;; (BUFFER-MATCHER
	;; LIST-OF-DISPLAY-FUNCTIONS
	;; &optional PARAMATERS)
	((and  "\\*julia\\* doc"
	 (derived-mode . markdown-view-mode))
	 ;; list of display function
	 (display-buffer-reuse-window
	  display-buffer-in-side-window)
	 ;; parameters
	 (side . right)
	 (window-width . 0.45)
	 (reusable-frames . visible)
	 )

	((and  "\\*julia\\* error"
	 (derived-mode . compilation-mode))
	 ;; list of display function
	 (display-buffer-below-selected)
	 ;; parameters
	 (window-height . 0.30)
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
	 )))

(use-package windmove
  :ensure nil  ; windmove is built-in
  :bind (("s-h" . windmove-left)
         ("s-j" . windmove-down)
         ("s-k" . windmove-up)
         ("s-l" . windmove-right))
  :config
  ;; Optional: set behavior when reaching window edges
  (setq windmove-wrap-around t))  ; wrap around to opposite side

(use-package popper
  :ensure t ; or :straight t
  :bind (("C-`"   . popper-toggle)
         ("M-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
	  "\\*eldoc\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          help-mode
          compilation-mode))
  (popper-mode +1)
  (popper-echo-mode +1))                ; For echo area hints

(provide 'setup-windows)
