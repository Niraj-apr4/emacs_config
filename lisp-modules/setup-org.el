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


(define-minor-mode my/writing-config-mode
  "A minor mode that enables a collection of other minor modes"
  :init-value nil
  :lighter " Write-Config"
  :keymap (make-sparse-keymap)
  (if my/writing-config-mode
      (progn
        ;; Enable desired minor modes
	(flyspell-mode 1)
        (auto-fill-mode 1)
	(setq-local fill-column 72)
	(org-indent-mode 1)
	(org-preview-mode 1)
	(yas-minor-mode 1)
        )
    ;; Disable the minor modes when turning off 
    (flyspell-mode -1)
    (auto-fill-mode -1)
    (org-indent-mode -1)
    (org-auctex-mode -1)
    (yas-minor-mode -1)
    ;; Disable any other minor modes you enabled
    ))

;; Optionally, you can add a key binding to toggle the mode
(global-set-key (kbd "C-c w") 'my/writing-config-mode)

(provide 'setup-org)
