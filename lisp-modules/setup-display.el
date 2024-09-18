;; setup-display.el

;; contain mode-line-in-header : interactive function
;; adjusted-fring-mode : minor mode

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

(provide 'setup-display)
