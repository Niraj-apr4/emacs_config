;; setup-write.el
;; settings for writing comfortably in latex and orgmode


;; >>>  for insertion of picture from inkscape 
;; dependencies : inkscape
;; inkscape + latex 
(use-package ink
  :ensure(:host github
	  :repo "Niraj-apr4/ink"))
;; <<<

;; >>>  A small minor mode to use a big fringe
(defvar my/fringe-mode nil)
(define-minor-mode my/fringe-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global t
  :interactive nil
  :variable my/fringe-mode
  :group 'editing-basics
  (if (not my/fringe-mode)
      (set-fringe-style nil)
    (set-fringe-mode
     (/ (- (frame-pixel-width)
           (* 100 (frame-char-width)))
        2))))
;; <<< 

;; >>> Get rid of the indicators in the fringe
(mapcar (lambda(fb) (set-fringe-bitmap-face fb 'org-hide))
        fringe-bitmaps)
;; <<<

;; >>> function to toggle the display  mode-line as a header
(defvar-local header-line-format nil)
(defun mode-line-in-header ()
  (if (not header-line-format)
      (setq header-line-format mode-line-format
            mode-line-format nil)
    (setq mode-line-format header-line-format
          header-line-format nil))
  (set-window-buffer nil (current-buffer)))
;; <<<

;; TODO write a minor mode my/writing-mode
;; that activates required modes and setup for writing 
(defvar my/writing-mode nil)
(define-minor-mode my/writing-mode
  " minor mode that setup other minor modes for writing "
  :init-value nil
  :global t
  :variable my/writing-mode
  :lighter " my/writing-mode"
  :group 'editing-basics
  (if my/writing-mode
      (progn (my/fringe-mode 1 )
	     (mode-line-in-header))
    (progn ( my/fringe-mode -1 )
	   (mode-line-in-header))))


(provide 'setup-write)
