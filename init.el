; visualization settings
(menu-bar-mode -1) ; hide menu bar
(scroll-bar-mode -1) ; hide scroll bar
(tool-bar-mode -1) ; hide tool bar
(electric-pair-mode 1)
(fringe-mode 0) ; remove fringes

(setq inhibit-startup-screen t) ; inhibit startup screen

;; setup fonts 
(set-face-attribute 'default nil :font "JuliaMono 12") ;default font fira code
(set-face-attribute 'fixed-pitch nil :font "JuliaMono 12") ;fixed pitch fira code

;; Store automatic customisation options elsewhere
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; prog-mode hooks
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)

; enable melpa 
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use package declaration
(eval-when-compile
  (require 'use-package))

(add-to-list 'load-path "~/.emacs.d/lisp-modules")
(add-to-list 'load-path "~/.emacs.d/modus-themes")

;; magit
(use-package magit
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))


(use-package pdf-tools
  :ensure t)


(use-package window
  :custom
  (display-buffer-alist
   '(("\\*Python\\*"
      (display-buffer-in-side-window)
      (window-width . 0.45)
      (side . right)
      (slot . -1))
    ("\\*gud-pdb\\*"
      (display-buffer-in-side-window)
      (window-height . 0.45)
      (side . bottom)
      (slot . -1)))))
   

;; (add-to-list 'display-buffer-alist 
;; '("^\\*Python\\*$" . (display-buffer-in-side-window)))
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

;; map python-mode to python-ts-mode to use treesitter library 
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))

(use-package eglot
  :defer t
  :hook (python-ts-mode . eglot-ensure))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

(require 'setup-vim-keybindings)
(require 'setup-dired) ;dired settings 
(require 'setup-completion) ;settings for completions packages : vertico , corfu , odorless
(require 'setup-julia) ; enable julia programming
(require 'setup-vterm) ; enable featured terminal emulation
(require 'setup-python) ; enable python programming
(require 'setup-latex-input) 
(require 'setup-org)

;; load-path for testing lisp modules
(add-to-list 'load-path "~/.emacs.d/testing")
(require 'org-auctex)
