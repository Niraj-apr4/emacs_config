;; setu-ui.el


;; ;; Essential settings 
(fringe-mode '(8 . 0))                       ;; set fringes  width

;; setup fonts
(let ((mono-spaced-font "Iosevka Term")
      (proportionately-spaced-font "Iosevka Aile"))
  (set-face-attribute 'default nil :family mono-spaced-font :height 128)
  (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
  (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0))
(set-fontset-font t 'greek "STIX Two Text")

;; ------------------------ THEMES ----------------------- 
(use-package standard-themes
  :ensure t
  :config
  (load-theme 'standard-light t))
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
  (setq spacious-padding-widths
      '( :internal-border-width 15
         :header-line-width 3
         :mode-line-width 1
         :tab-width 3
         :right-divider-width 30
         :scroll-bar-width 8))
  (setq x-underline-at-descent-line t)
  ;; (setq spacious-padding-subtle-frame-lines
  ;;     `( :mode-line-active 'default
  ;;        :mode-line-inactive vertical-border))
  (spacious-padding-mode 1))

(provide 'setup-ui)
