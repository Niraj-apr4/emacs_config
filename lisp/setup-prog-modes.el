;; setup-prog-modes.el

;; prog-mode hooks
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; ---------------- treesit -----------------------
(use-package treesit
  :config
  (setq treesit-language-source-alist
        '((rust "https://github.com/tree-sitter/tree-sitter-rust")
	  (bash "https://github.com/tree-sitter/tree-sitter-bash")))
  ;; Auto-install rust grammar if it's missing
  (unless (treesit-language-available-p 'rust)
    (treesit-install-language-grammar 'rust))
  (unless (treesit-language-available-p 'bash)
    (treesit-install-language-grammar 'bash)))
;; -------------------------------------------------

;; ------------- julia editor support --------------

(use-package julia-mode
  :ensure t)

(use-package julia-vterm 
  :ensure t
  :hook(julia-mode . julia-vterm-mode))
;; -------------------------------------------------

;; ---------------- rust support -------------------
(use-package rust-mode
  :ensure t
  :init
  (setq rust-mode-treesitter-derive t))

(use-package rustic
  :ensure t
  :after(rust-mode)
  :config
  (setq rustic-lsp-client 'eglot)
  (setq rustic-format-on-save nil)
  :custom
  (rustic-cargo-use-last-stored-arguments t))
;; -------------------------------------------------

(provide 'setup-prog-modes)
