(use-package org
  :custom
  (org-use-sub-superscripts '{})
  (org-startup-folded t)
  (org-image-align 'center)
  (org-indent-mode-turns-on-hiding-stars nil)
  (org-pretty-entities-include-sub-superscripts t)
  (org-highlight-latex-and-related '( native ))

  :bind(:map org-mode-map
	     (";" . cdlatex-math-symbol))

  :hook((org-mode . turn-on-org-cdlatex)
	(org-mode . org-toggle-pretty-entities)
	(org-mode . visual-line-mode)))

;; org-babel setups
(org-babel-do-load-languages
 'org-babel-load-languages
 '((julia . t)))

(provide 'setup-org)
