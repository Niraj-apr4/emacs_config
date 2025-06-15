;; niraj-vim-keybindings.el

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (add-to-list 'evil-motion-state-modes 'markdown-view-mode)
  (add-to-list 'evil-motion-state-modes 'image-mode)
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init 'dired))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))


(provide 'setup-vim-keybindings)
