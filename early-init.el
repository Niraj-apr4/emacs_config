;; early-init.el 

(setq package-enable-at-startup nil)

;; dwm resizes the emacs
;; this is required to set full screen 
(setq frame-resize-pixelwise t)

; visualization settings startup
(menu-bar-mode -1) ; hide menu bar
(scroll-bar-mode -1) ; hide scroll bar
(tool-bar-mode -1) ; hide tool bar
(setq inhibit-startup-screen t) ; inhibit startup screen
