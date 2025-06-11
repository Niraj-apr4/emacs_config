;; setup-org.el

;; please ensure of the settings made in setup-text-mode.el
;; as settings made for text-mode in setup-text-mode.el are
;; also applied in text-mode based major-modes like org-mode 

;; use org development branch for org-live-preview feature
;; >>>
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
;; <<<

;; setup default behaviour for org-mode
;; <<<
(use-package org
  :bind(:map org-cdlatex-mode-map
	     (";" . cdlatex-math-symbol))

  :hook((org-mode . turn-on-org-cdlatex)
	(org-mode . org-toggle-pretty-entities))
	

  :config
  (setq-default
  org-startup-folded t
  org-highlight-latex-and-related '( native )
  org-indent-mode-turns-on-hiding-stars nil
  org-use-sub-superscripts '{}
  org-pretty-entities-include-sub-superscripts nil
  org-image-align 'center)
  
  ;; org-cdlatex-mode
  ;; avail auto insertion of brackets in org-cdlatex-mode
  ;; >>> 
   (defun org-cdlatex-pbb (&rest _arg)
    "Execute `cdlatex-pbb' in LaTeX fragments.
     Revert to the normal definition outside of these fragments."
    (interactive "P")
    (if (org-inside-LaTeX-fragment-p)
        (call-interactively 'cdlatex-pbb)
      (let (org-cdlatex-mode)
        (call-interactively (key-binding (vector last-input-event))))))
    
  (define-key org-cdlatex-mode-map (kbd "(") #'org-cdlatex-pbb) 
  (define-key org-cdlatex-mode-map (kbd "[") #'org-cdlatex-pbb)
  (define-key org-cdlatex-mode-map (kbd "{") #'org-cdlatex-pbb)
  ;; >>>
  
  )
;; <<<

;; settings for org-latex-preview 
;; >>>
(use-package org
  :defer t
  :config
   (setq-default
      org-format-latex-options
   (progn (plist-put org-format-latex-options :background "Transparent")
          (plist-put org-format-latex-options :scale 1.0)
          (plist-put org-format-latex-options :zoom
                     (- (/ (face-attribute 'default :height) 100.0) 0.025)))

   org-latex-preview-appearance-options
   (progn (plist-put org-latex-preview-appearance-options :scale 1.0)
          (plist-put org-latex-preview-appearance-options :zoom
                     (- (/ (face-attribute 'default :height) 100.0) 0.025)))

   org-latex-preview-numbered t
   org-latex-preview-live-debounce 0.3
   org-latex-preview-auto-track-inserts t
   org-latex-preview-live '(block edit-special)
   org-latex-preview-process-active-indicator nil))
;; <<<

(use-package org-appear
  :ensure t
  :hook(org-mode . org-appear-mode)
  :config
  (setq org-hide-emphasis-markers t))

(use-package org-modern
  :ensure (:host github
             :repo "minad/org-modern")
  :after org
  :hook ((org-modern-mode . my/org-modern-spacing)
         (org-mode . org-modern-mode)
         )
  :config
  (defun my/org-modern-spacing ()
    (setq-local line-spacing
                (if org-modern-mode
                    0.1 0.0)))
  (setq org-modern-todo nil
        org-modern-hide-stars nil
        org-modern-horizontal-rule nil
        org-modern-keyword "‣ "
        ;; org-modern-block-fringe 0 
        org-modern-table nil))

;; ------------------- WRITE LaTeX -------------------

(defvar-local my/write-LaTeX-enabled nil)
(defvar-local assist-modes '(yas-minor-mode
		     org-latex-preview-auto-mode))
;; helper function
(defun modes-switch (modes action)
  "helper function to apply value(action) to list of modes"
  (dolist (mode modes)
    (funcall mode action)))

(defun my/write-LaTeX-toggle ()
  "toggles LaTeX support for writing in org-mode buffers"
  (interactive)
  (if (not my/write-LaTeX-enabled)
      (progn (modes-switch assist-modes 1)
	     (yas-reload-all)
	     (setq my/write-LaTeX-enabled 'enabled))
    (progn (modes-switch assist-modes -1)
	   (setq my/write-LaTeX-enabled nil))))

;; ----------------------------------------------------

;; ------------- ORG BABEL --------------------------
;; babel support from ob-julia-vterm
;; TODO also implement builtin julia org babel support for testing

;; ensure that julia-vterm is installed in setup-progmode.el
(use-package ob-julia-vterm ;; for org-babel support
  :ensure t)

(use-package org
  :defer t
  :custom
  (org-src-window-setup 'current-window)
  :config
  (add-to-list 'org-babel-load-languages '(julia-vterm . t)) ;; ob-julia-vterm
  (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages))

;; --------------------------------------------------

(provide 'setup-org)
