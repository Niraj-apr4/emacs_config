;; >>> files and folder settings >>>
(use-package dired
  ;; hide details in dired buffer
  :hook ((dired-mode . dired-hide-details-mode))
  :config
  ;;set up dwim : when two dired buffers are open
  ;;can automatically specify next open dired buffer as
  ;;target for file operations like copying and replacing
  (setq dired-dwim-target t))

(use-package rfn-eshadow
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy)
  :config
  (file-name-shadow-mode 1))

(setq trash-directory "~/.recycle-bin")
(setq delete-by-moving-to-trash t)

(use-package dired-x 
  :config
  ;;dot files are not included as default in
  ;;dired-omit-files
    (setq dired-omit-files
	(concat dired-omit-files "\\|^\\..+$")))

;; >>> files and folder settings >>>
(provide 'setup-dired)
