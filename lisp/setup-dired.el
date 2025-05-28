;; >>> files and folder settings >>>
(use-package dired
  :ensure nil
  :commands (dired)
  :hook
  ((dired-mode . dired-hide-details-mode)
   (dired-mode . hl-line-mode))
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  (setq dired-dwim-target t))

(use-package dired-subtree
  :ensure t
  :after dired
  :bind
  ( :map dired-mode-map
    ("<tab>" . dired-subtree-toggle)
    ("TAB" . dired-subtree-toggle)
    ("<backtab>" . dired-subtree-remove)
    ("S-TAB" . dired-subtree-remove))
  :config
  (setq dired-subtree-use-backgrounds nil))

;; (setq trash-directory "~/.recycle-bin")

(use-package trashed
  :ensure t
  :commands (trashed)
  :config
  (setq trashed-action-confirmer 'y-or-n-p)
  (setq trashed-use-header-line t)
  (setq trashed-sort-key '("Date deleted" . t))
  (setq trashed-date-format "%Y-%m-%d %H:%M:%S"))

(use-package rfn-eshadow
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy)
  :config
  (file-name-shadow-mode 1))


(use-package dired-x 
  :config
  ;;dot files are not included as default in
  ;;dired-omit-files
    (setq dired-omit-files
	(concat dired-omit-files "\\|^\\..+$")))

;; >>> files and folder settings >>>
(provide 'setup-dired)
