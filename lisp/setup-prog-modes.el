;; setup-prog-modes.el

;; prog-mode hooks
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; ------------- julia editor support --------------

(use-package julia-mode
  :ensure t)

(use-package julia-snail
  :ensure t
  :hook (julia-mode . julia-snail-mode))


(use-package ess
  :ensure t
  :defer t)

;; -------------------------------------------------

;; ---------------- rust support -------------------
(use-package rustic
  :ensure t
  :config
  (setq rustic-format-on-save nil)
  :custom
  (rustic-cargo-use-last-stored-arguments t))
;; -------------------------------------------------

(provide 'setup-prog-modes)
