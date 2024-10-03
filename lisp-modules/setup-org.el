;; setup-org.el

(use-package org
  :defer
  :ensure `(org
            :remotes ("tecosaur"
                      :repo "https://git.tecosaur.net/tec/org-mode.git"
                      :branch "dev")
            :files (:defaults "etc")
            :build t
            :pre-build
            (with-temp-file "org-version.el"
             (require 'lisp-mnt)
             (let ((version
                    (with-temp-buffer
                      (insert-file-contents "lisp/org.el")
                      (lm-header "version")))
                   (git-version
                    (string-trim
                     (with-temp-buffer
                       (call-process "git" nil t nil "rev-parse" "--short" "HEAD")
                       (buffer-string)))))
              (insert
               (format "(defun org-release () \"The release version of Org.\" %S)\n" version)
               (format "(defun org-git-version () \"The truncate git commit hash of Org mode.\" %S)\n" git-version)
               "(provide 'org-version)\n")))
            :pin nil))

;; (use-package org-latex-preview
;;   :after org-latex-preview
;;   :config
;;   ;; Increase preview width
;;   (plist-put org-latex-preview-appearance-options
;;              :page-width 2.8)

;;   ;; Use dvisvgm to generate previews
;;   ;; You don't need this, it's the default:
  
;;   ;; Turn on auto-mode, it's built into Org and much faster/more featured than
;;   ;; org-fragtog. (Remember to turn off/uninstall org-fragtog.)

;;   ;; Block C-n and C-p from opening up previews when using auto-mode
;;   (add-hook 'org-latex-preview-auto-ignored-commands 'next-line)
;;   (add-hook 'org-latex-preview-auto-ignored-commands 'previous-line)

;;   ;; Enable consistent equation numbering
;;   (setq org-latex-preview-numbered t)

;;   ;; Bonus: Turn on live previews.  This shows you a live preview of a LaTeX
;;   ;; fragment and updates the preview in real-time as you edit it.
;;   ;; To preview only environments, set it to '(block edit-special) instead
;;   (setq org-latex-preview-live t)

;;   ;; More immediate live-previews -- the default delay is 1 second
;;   )

;; code for centering LaTeX previews -- a terrible idea
;; (use-package org-latex-preview
;;   :after org-latex-preview
;;   :config
;;   (defun my/org-latex-preview-uncenter (ov)
;;     (overlay-put ov 'before-string nil))
;;   (defun my/org-latex-preview-recenter (ov)
;;     (overlay-put ov 'before-string (overlay-get ov 'justify)))
;;   (defun my/org-latex-preview-center (ov)
;;     (save-excursion
;;       (goto-char (overlay-start ov))
;;       (when-let* ((elem (org-element-context))
;;                   ((or (eq (org-element-type elem) 'latex-environment)
;;                        (string-match-p "^\\\\\\[" (org-element-property :value elem))))
;;                   (img (overlay-get ov 'display))
;;                   (prop `(space :align-to (- center (0.55 . ,img))))
;;                   (justify (propertize " " 'display prop 'face 'default)))
;;         (overlay-put ov 'justify justify)
;;         (overlay-put ov 'before-string (overlay-get ov 'justify)))))
;;   (define-minor-mode org-latex-preview-center-mode
;;     "Center equations previewed with `org-latex-preview'."
;;     :global nil
;;     (if org-latex-preview-center-mode
;;         (progn
;;           (add-hook 'org-latex-preview-overlay-open-functions
;;                     #'my/org-latex-preview-uncenter nil :local)
;;           (add-hook 'org-latex-preview-overlay-close-functions
;;                     #'my/org-latex-preview-recenter nil :local)
;;           (add-hook 'org-latex-preview-overlay-update-functions
;;                     #'my/org-latex-preview-center nil :local))
;;       (remove-hook 'org-latex-preview-overlay-close-functions
;;                     #'my/org-latex-preview-recenter)
;;       (remove-hook 'org-latex-preview-overlay-update-functions
;;                     #'my/org-latex-preview-center)
;;       (remove-hook 'org-latex-preview-overlay-open-functions
;;                     #'my/org-latex-preview-uncenter))))

(use-package org
  :custom
  (org-startup-folded t)
  (org-highlight-latex-and-related '( native ))
  (org-indent-mode-turns-on-hiding-stars nil)
  (org-use-sub-superscripts '{})
  (org-pretty-entities-include-sub-superscripts nil)
  (org-image-align 'center)

  :bind(:map org-cdlatex-mode-map
	     (";" . cdlatex-math-symbol))

  :hook((org-mode . turn-on-org-cdlatex)
	(org-mode . org-toggle-pretty-entities)
	(org-mode . visual-line-mode))
  :config
  (setq org-format-latex-options
	(plist-put org-format-latex-options :scale 1.5)))

;; ;; org-babel setups
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((julia . t)))

(provide 'setup-org)
