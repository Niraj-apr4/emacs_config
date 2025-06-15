
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

(setq eglot-connect-timeout 300 ) ;; increased for julia  

;; syntax 
(use-package julia-mode
  :ensure t)

;; language server protocol
(use-package eglot-jl
  :ensure t
  :hook (julia-mode . (lambda ()
                        (eglot-jl-init)
                        ;; (eglot-ensure)
			))
  :config
  (setq eglot-jl-language-server-project-root nil)
  (setq eglot-jl-julia-command "/home/niraj/julia/bin/julia"))

;; repl 
(use-package julia-snail
  :ensure t
  :hook (julia-mode . julia-snail-mode)
  :config
  (setq julia-snail-use-emoji-mode-lighter nil)
  (defun my/save-run-buffer-file()
    (interactive)
    (when (buffer-modified-p)
      (save-buffer))
    (julia-snail-send-buffer-file))

  (setq julia-snail-terminal-type :vterm)

  (setq-default
   julia-snail-multimedia-enable t
   julia-snail-multimedia-buffer-style :single-new
   julia-snail-show-error-window t)

  :bind ("C-c b" . my/save-run-buffer-file))

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
