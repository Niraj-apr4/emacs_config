; visualization settings
(menu-bar-mode -1) ;; hide menu bar
(scroll-bar-mode -1) ;; hide scroll bar
(tool-bar-mode -1) ;; hide tool bar
(global-visual-line-mode) ;; globally activate visual line mode

(setq inhibit-startup-screen t) ;; inhibit startup screen

;; setup fonts 
(set-face-attribute 'default nil :font "Fira Code 12") ;default font fira code
(set-face-attribute 'fixed-pitch nil :font "Fira Code 12") ;fixed pitch fira code
(set-face-attribute 'variable-pitch nil :font "Latin Modern Math 15") ;variable pitch computer modern

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

;; magit
(use-package magit
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; VI key-bindings
(use-package evil
  :ensure t
  :init
    (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init 'dired))

;; auctex settings
(use-package tex
  :ensure auctex
  :pin gnu
  :hook ((LaTeX-mode . prettify-symbols-mode)))

;; cdlatex settings
(use-package cdlatex
  :ensure t
  :hook (LaTeX-mode . turn-on-cdlatex))


;; copied 
;; Yasnippet settings
(use-package yasnippet
  :ensure t
  :hook ((LaTeX-mode . yas-minor-mode)
         (post-self-insert . my/yas-try-expanding-auto-snippets))
  :config
    (setq yas-snippet-dirs '("~/repositories/yasnippets"))
  (use-package warnings
    :config
    (cl-pushnew '(yasnippet backquote-change)
                warning-suppress-types
                :test 'equal))

  (setq yas-triggers-in-field t)
  
  ;; Function that tries to autoexpand YaSnippets
  ;; The double quoting is NOT a typo!
  (defun my/yas-try-expanding-auto-snippets ()
    (when (and (boundp 'yas-minor-mode) yas-minor-mode)
      (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
        (yas-expand)))));; yasnippet settings

(use-package preview
  :after latex
  :hook ((LaTeX-mode . preview-larger-previews))
  :config
  (defun preview-larger-previews ()
    (setq preview-scale-function
          (lambda () (* 2.50
                   (funcall (preview-scale-from-face)))))))

(use-package denote
  :ensure t
  :hook ((dired-mode . denote-dired-mode))
  :config
  (setq denote-directory (expand-file-name "~/notes/")))


(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package pdf-tools
  :ensure t)

(use-package mixed-pitch
  :ensure t
  :config
  ;; TODO set the variable mixed-pitch-fixed-pitch-faces for
  ;; a list of which faces to remain fixed
  ;; TODO key words to remain fixed pitch 
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'org-modern-todo)
  (setq mixed-pitch-set-height 1))

(load "~/.emacs.d/niraj/read-write.el")

(evil-global-set-key 'insert (kbd "C-h") 'delete-backward-char)

(use-package doom-themes
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

(use-package eglot
  :defer t
  :hook (python-ts-mode . eglot-ensure))

(use-package org-modern
    :ensure t
    :custom
    (org-modern-keyword nil)
    (org-modern-checkbox nil)
    (org-modern-block-name nil)
    (org-modern-table nil)
    :config
    (global-org-modern-mode 1)
)

(use-package ef-themes
  :ensure t)

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

(add-to-list 'load-path "~/.emacs.d/niraj-modules")
(require 'niraj-dir-editor)
(require 'niraj-completion)
(require 'niraj-ligature-support)

;; load org-mode configuration
(load "~/.emacs.d/niraj/org-mode.el")

;; load packages auto activating snippets  and latex auto activating snippets
(load "~/.emacs.d/niraj/auto-snippets-system.el")
