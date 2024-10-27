;; setup-text-mode.el
;; settings for all text mode buffers

;; ensure that function , minor modes defined here
;; should only available to enable in text-mode major mode buffers

;; enable visual line mode in all text mode buffers
(add-hook 'text-mode-hook 'visual-line-mode)

;; ------------------ MARGINS --------------------
;; automatically set up margins in only text mode buffers
;; should  be buffer local and if vertically split , it should
;; change width to a appropriate value or nil 
(defun my-set-margins ()
  "Set margins in current buffer."
  (setq left-margin-width 37)
  (setq right-margin-width 37))

(add-hook 'text-mode-hook 'my-set-margins)
;; ------------------------------------------------

;; ------------------ MODELINE --------------------
;; option to hide mode-line and show in header 
(defvar-local hidden-mode-line-mode nil)
(defvar-local hide-mode-line nil)

(define-minor-mode hidden-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global nil
  :variable hidden-mode-line-mode
  :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (force-mode-line-update)
  ;; Apparently force-mode-line-update is not always enough to
  ;; redisplay the mode-line
  (redraw-display)
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x hidden-mode-line-mode to make the mode-line appear."))))

;; Command to toggle the display of the mode-line as a header
(defvar-local header-line-format nil)
(defun mode-line-in-header ()
  (interactive)
  (if (not header-line-format)
      (setq header-line-format mode-line-format
            mode-line-format nil)
    (setq mode-line-format header-line-format
          header-line-format nil))
  (set-window-buffer nil (current-buffer)))
(global-set-key (kbd "C-s-SPC") 'mode-line-in-header)
;; ----------------------------------------------

;; --------- For org and latex major modes -------
;; inkscape + latex support
;; to be used in org and LaTeX major modes 
;; >>>
(use-package ink
  :ensure(:host github
	  :repo "Niraj-apr4/ink"))
;; <<<
;; --------------------------------------------
(provide 'setup-text-modes)
