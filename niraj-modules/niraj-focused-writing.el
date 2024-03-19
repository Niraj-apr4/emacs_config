;; fringe mode for focused writing 

(defvar niraj/big-fringe-mode nil)
(define-minor-mode niraj/big-fringe-mode
  "Minor mode to use big fringe in the current buffer."
  :init-value nil
  :global t
  :variable niraj/big-fringe-mode
  :group 'editing-basics
  (if (not niraj/big-fringe-mode)
      (set-fringe-style nil)
    (set-fringe-mode
     (/ (- (frame-pixel-width)
           (* 100 (frame-char-width)))
        2))))

;; TODOs
;; build up a minor mode  that set up the following 
;; set up big fringe mode 
;; set up org-indent-mode
;; set up autofill-mode and setup fill-column margin to 70

(provide 'niraj-focused-writing)
