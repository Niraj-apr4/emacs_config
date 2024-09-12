
;; org-preview.el library to be used until org-mode get updated
;; org-latex-preview feature
(require 'org-preview)

;; helper functions and commands
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

;; A small minor mode to use a big fringe
(defvar adjusted-fringe-mode nil)
(define-minor-mode adjusted-fringe-mode
  "Minor mode to use big fringe in the current buffer."
  :init-value nil
  :global nil
  :variable adjusted-fringe-mode
  :group 'editing-basics
  (if (not adjusted-fringe-mode)
      (set-fringe-style nil)
    (set-fringe-mode
     (/ (- (frame-pixel-width)
           (* 100 (frame-char-width)))
        2))))

;; Get rid of the indicators in the fringe
(mapcar (lambda(fb) (set-fringe-bitmap-face fb 'org-hide))
        fringe-bitmaps)

;; setup write-config-mode
;; this essentially activates the required modes
;; to create a comfortable writing environment 

(setq to-activate-modes ; 
      '(adjusted-fringe-mode
	flyspell-mode
	auto-fill-mode
	org-indent-mode
	org-preview-mode
	yas-minor-mode))

(define-minor-mode my/writing-config-mode
  "A minor mode that enables a collection of other minor modes"
  :init-value nil
  :global nil
  :lighter " Write-Config"
  :keymap (make-sparse-keymap)
  (if my/writing-config-mode
      (progn
	;; activate minor-modes
        (dolist (mode to-activate-modes)
	  (funcall mode 1))
	(mode-line-in-header)
	(setq-local fill-column 72)
	(yas-reload-all)
	)

    ;; toggle off activated modes
    (progn
      (dolist (mode to-activate-modes)
      (funcall mode -1)))
    ))

;; Optionally, you can add a key binding to toggle the mode
(global-set-key (kbd "C-c w") 'my/writing-config-mode)

;;TODO make this file agnostic so that it works in text, and latex-mode 
;;TODO improve code
;;TODO improve key-bindings 

(provide 'write-config)
