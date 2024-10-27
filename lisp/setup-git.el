
;; setup-git.el
;; install magit
(elpaca (magit :branch "main" :pre-build ("make" "info")))
(elpaca (transient :branch "main"))
(use-package magit
  :ensure t)

(provide 'setup-git)
