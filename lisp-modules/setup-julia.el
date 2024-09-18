;; julia editor support

(use-package julia-mode
  :ensure t)

(use-package julia-snail
  :ensure t
  :hook (julia-mode . julia-snail-mode))


(use-package ess
  :ensure t
  :defer t)

(provide 'setup-julia)
