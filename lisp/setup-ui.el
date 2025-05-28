;; setu-ui.el

;; ;; Essential settings 
(fringe-mode '(8 . 0))                       ;; set fringes  width

;; setup fonts 
(set-face-attribute 'default nil :font "Aporetic Sans Mono 12") ;default font 
(set-face-attribute 'fixed-pitch nil :font "Aporetic Sans Mono 12") ;fixed pitch 
(set-face-attribute 'variable-pitch nil :family "Aporetic Sans" :height 1.15) ;variable pitch


;; ------------------------ THEMES ----------------------- 
(use-package modus-themes 
  :ensure t
  :config
  (setq modus-themes-common-palette-overrides
      '((border-mode-line-active unspecified)
        (border-mode-line-inactive unspecified)
	(fringe unspecified)
	(bg-prose-block-contents unspecified)
	(bg-prose-block-delimiter unspeficied)
	(fg-prose-block-delimiter fg-dim)))
  (load-theme 'modus-operandi t))

(use-package ef-themes
  :disabled 
  :ensure t
  :config
  (load-theme 'ef-arbutus))
  
;; --------------------------------------------------------




(provide 'setup-ui)
