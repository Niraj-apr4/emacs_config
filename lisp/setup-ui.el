;; setu-ui.el

(fringe-mode '(8 . 0)) ;; set fringes  width

;; setup fonts 
(set-face-attribute 'default nil :font "Iosevka Comfy 12") ;default font 
(set-face-attribute 'fixed-pitch nil :font "Iosevka Comfy 12") ;fixed pitch 
(set-face-attribute 'variable-pitch nil :family "STIX Two Text" :height 150) ;variable pitch


;; ------------------------ THEMES ----------------------- 
(use-package standard-themes
  :ensure t
  :config
  (load-theme 'standard-dark)
  (defun my/standard-themes-settings ()
    (custom-set-faces
    '(default ((t (:background "black" :foreground "grey"))))
    '(fringe ((t (:background "black"))))))
  (my/standard-themes-settings))

(use-package ef-themes
  :disabled 
  :ensure t
  :config
  (load-theme 'ef-arbutus))
  
;; --------------------------------------------------------

(provide 'setup-ui)
