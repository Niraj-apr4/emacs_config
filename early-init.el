;; Example Elpaca early-init.el -*- lexical-binding: t; -*-

(setq package-enable-at-startup nil)

; visualization settings startup
(menu-bar-mode -1) ; hide menu bar
(scroll-bar-mode -1) ; hide scroll bar
(tool-bar-mode -1) ; hide tool bar
(setq inhibit-startup-screen t) ; inhibit startup screen

;; Local Variables:
;; no-byte-compile: t
;; no-native-compile: t
;; no-update-autoloads: t
;; End:
