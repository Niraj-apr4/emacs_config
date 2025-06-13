;; setu-ui.el


;; ;; Essential settings 
(fringe-mode '(8 . 0))                       ;; set fringes  width

;; setup fonts
(let ((mono-spaced-font "Aporetic Sans Mono")
      (proportionately-spaced-font "Iosevka Etoile"))
  (set-face-attribute 'default nil :family mono-spaced-font :height 128)
  (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
  (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0))

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
  (load-theme 'modus-operandi t))

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

(use-package spacious-padding
  :ensure t
  :config
  ;; These are the default values, but I keep them here for visibility.
    (setq spacious-padding-widths
	'( :internal-border-width 15
	    :header-line-width 4
	    :mode-line-width 6
	    :tab-width 4
	    :right-divider-width 30
	    :scroll-bar-width 8
	    :fringe-width 8))

    ;; Read the doc string of `spacious-padding-subtle-mode-line' as it
    ;; is very flexible and provides several examples.

    (setq spacious-padding-subtle-frame-lines
      '(:mode-line-active "#0000ff" :mode-line-inactive "gray50"))

    (setq spacious-padding-subtle-frame-lines
      '( :mode-line-active spacious-padding-line-active
         :mode-line-inactive spacious-padding-line-inactive
         :header-line-active spacious-padding-line-active
         :header-line-inactive spacious-padding-line-inactive))

    ;; (setq spacious-padding-subtle-frame-lines
    ;; 	`( :mode-line-active 'default
    ;; 	    :mode-line-inactive vertical-border))

    ;; ;; Make the underlines appear below the base line, to create a more
    ;; ;; consistent effect between overlines and underlines.
    (setq x-underline-at-descent-line t)

    (spacious-padding-mode 1))


(provide 'setup-ui)
