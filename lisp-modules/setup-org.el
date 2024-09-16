;; setup-org.el

(use-package org
  :custom
  (org-startup-folded t)
  (org-highlight-latex-and-related '( native ))
  (org-indent-mode-turns-on-hiding-stars nil)
  (org-use-sub-superscripts '{})
  (org-pretty-entities-include-sub-superscripts nil)

  :bind(:map org-cdlatex-mode-map
	     (";" . cdlatex-math-symbol))

  :hook((org-mode . turn-on-org-cdlatex)
	(org-mode . org-toggle-pretty-entities)
	(org-mode . visual-line-mode))
  :config
  (setq org-format-latex-options
	(plist-put org-format-latex-options :scale 1.5)))

;; org-babel setups
(org-babel-do-load-languages
 'org-babel-load-languages
 '((julia . t)))


(require 'setup-display) ; require setup-display.el
(require 'org-preview) ; require org-preview.el

(setq to-activate-modes ; 
      '(adjusted-fringe-mode
	flyspell-mode
	auto-fill-mode
	org-indent-mode
	org-preview-mode
	yas-minor-mode))

(define-minor-mode my/write-config-mode
  "A minor mode that enables a collection of other minor modes"
  :init-value nil
  :global nil
  :lighter " Write-Config-Org"
  :keymap (make-sparse-keymap)
  (if my/write-config-mode
      (progn
	;; activate minor-modes
        (dolist (mode to-activate-modes)
	  (funcall mode 1))
	;; run required functions 
	(mode-line-in-header) 
	(setq-local fill-column 77)
	(yas-reload-all))

    ;; toggle off activated modes
    (progn
      (dolist (mode to-activate-modes)
      (funcall mode -1)))
    ))

(use-package org
  :bind(:map org-mode-map
	     ("C-c w" . my/write-config-mode)))

(provide 'setup-org)
