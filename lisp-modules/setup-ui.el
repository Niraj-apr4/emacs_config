
; visualization settings
(menu-bar-mode -1) ; hide menu bar
(scroll-bar-mode -1) ; hide scroll bar
(tool-bar-mode -1) ; hide tool bar
;; (electric-pair-mode 1)

(fringe-mode '(8 . 0)) ;; set fringes 

(setq inhibit-startup-screen t) ; inhibit startup screen

;; setup fonts 
(set-face-attribute 'default nil :font "Iosevka Comfy 12") ;default font fira code
(set-face-attribute 'fixed-pitch nil :font "Iosevka Comfy 12") ;fixed pitch fira code

;; prog-mode hooks
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)
(provide 'setup-ui)