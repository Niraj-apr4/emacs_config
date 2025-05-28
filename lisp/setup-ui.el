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
	(bg-prose-block-contents bg-magenta-nuanced)
	(bg-prose-block-delimiter bg-lavendar)
	(fg-prose-block-delimiter fg-main)))
  (load-theme 'modus-operandi-tinted t))

(use-package ef-themes
  :disabled 
  :ensure t
  :config
  (load-theme 'ef-arbutus))
  
;; --------------------------------------------------------

(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))


(provide 'setup-ui)
