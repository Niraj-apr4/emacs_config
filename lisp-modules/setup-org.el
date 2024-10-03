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

;; ;; org-babel setups
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((julia . t)))

(provide 'setup-org)
