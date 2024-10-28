;; setu-ui.el

;; Essential settings 
(fringe-mode '(8 . 0))                       ;; set fringes  width

;; setup fonts 
(set-face-attribute 'default nil :font "Iosevka Comfy 12") ;default font 
(set-face-attribute 'fixed-pitch nil :font "Iosevka Comfy 12") ;fixed pitch 
(set-face-attribute 'variable-pitch nil :family "STIX Two Text" :height 150) ;variable pitch


;; ------------------------ THEMES ----------------------- 
(use-package modus-themes 
  :ensure t
  :config
  (setq modus-themes-common-palette-overrides
      '((border-mode-line-active unspecified)
        (border-mode-line-inactive unspecified)
	(fringe unspecified)))
  (load-theme 'modus-operandi t))

(use-package ef-themes
  :disabled 
  :ensure t
  :config
  (load-theme 'ef-arbutus))
  
;; --------------------------------------------------------





(provide 'setup-ui)
