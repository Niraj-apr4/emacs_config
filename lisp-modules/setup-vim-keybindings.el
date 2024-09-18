;; niraj-vim-keybindings.el

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

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(evil-global-set-key 'insert (kbd "C-h") 'delete-backward-char)

(provide 'setup-vim-keybindings)
