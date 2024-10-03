;; setup-write.el
;; settings for writing comfortably

;; >>>  A small minor mode to use a big fringe
(defvar write-fringe-mode nil)
(define-minor-mode write-fringe-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global t
  :variable write-fringe-mode
  :group 'editing-basics
  (if (not write-fringe-mode)
      (set-fringe-style nil)
    (set-fringe-mode
     (/ (- (frame-pixel-width)
           (* 100 (frame-char-width)))
        2))))
;; <<< 

;; Get rid of the indicators in the fringe
(mapcar (lambda(fb) (set-fringe-bitmap-face fb 'org-hide))
        fringe-bitmaps)


;; >>> Command to toggle the display of the mode-line as a header
(defvar-local header-line-format nil)
(defun mode-line-in-header ()
  (interactive)
  (if (not header-line-format)
      (setq header-line-format mode-line-format
            mode-line-format nil)
    (setq mode-line-format header-line-format
          header-line-format nil))
  (set-window-buffer nil (current-buffer)))
;; <<< 

;; for insertion of picture from inkscape 
;; inkscape + latex 
(use-package ink
  :ensure(:host github
	  :repo "Niraj-apr4/ink"))

(provide 'setup-write)
