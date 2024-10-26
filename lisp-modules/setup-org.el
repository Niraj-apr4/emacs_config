;; setup-org.el

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
	(org-mode . org-toggle-pretty-entities)
	(org-mode . visual-line-mode))

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
  
  ;; TODO org-babel 
  ;; >>>
  (org-babel-do-load-languages
 'org-babel-load-languages
 '((julia . t)))
  ;; <<<
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

;; TODO write my/writing-mode-org n 
;; interactive command to toggle my/writing-mode with necessary
;;  assist modes for writing environment 
;; >>>
(setq assist-modes '(yas-minor-mode
		     org-latex-preview-auto-mode))

(defun modes-switch (modes action)
  "TODO"
  (dolist (mode modes)
    (funcall mode action)))

(defun my/writing-mode-org()
  "TODO"
  (interactive)
  (if (not my/writing-mode)
      (progn (my/writing-mode)
	     (modes-switch assist-modes 1))
    (progn (my/writing-mode -1)
	   (modes-switch assist-modes -1))))

;; setup key bindings 
(use-package org
  :bind(:map org-mode-map
	     ("C-c m w" . my/writing-mode-org)))
;; <<<
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
(provide 'setup-org)
