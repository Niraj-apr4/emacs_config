;; setup-text-mode.el
;; settings for all text mode buffers

;; ensure that function , minor modes defined here
;; should only available to enable in text-mode major mode buffers

(use-package olivetti
  :ensure
  :defer
  :diminish
  :config
  (setq-default olivetti-body-width 70)
  (setq olivetti-recall-visual-line-mode-entry-state t)

  (define-minor-mode prot/olivetti-mode
    "Toggle buffer-local `olivetti-mode' with additional parameters.

Fringes are disabled.  The modeline is hidden, except for
`prog-mode' buffers (see `prot/hidden-mode-line-mode').  The
default typeface is set to a proportionately-spaced family,
except for programming modes (see `prot/variable-pitch-mode').
The cursor becomes a blinking bar, per `prot/cursor-type-mode'."
    :init-value nil
    :global nil
    (if prot/olivetti-mode
        (progn
          (olivetti-mode 1)
          (set-window-fringes (selected-window) 0 0)
          (mixed-pitch-mode 1)
          (prot/cursor-type-mode 1)
          (prot/scroll-centre-cursor-mode 1)
          (prot/hidden-mode-line-mode 1))
      (olivetti-mode -1)
      (set-window-fringes (selected-window) nil) ; Use default width
      (mixed-pitch-mode -1)
      (prot/cursor-type-mode -1)
      (prot/scroll-centre-cursor-mode -1)
      (prot/hidden-mode-line-mode -1)))
  :bind ("C-c o" . prot/olivetti-mode))

(use-package emacs
  :commands prot/hidden-mode-line-mode
  :config
  (setq mode-line-percent-position '(-3 "%p"))
  (setq mode-line-defining-kbd-macro
        (propertize " Macro" 'face 'mode-line-emphasis))
  (setq-default mode-line-format
                '("%e"
                  mode-line-front-space
                  mode-line-mule-info
                  mode-line-client
                  mode-line-modified
                  mode-line-remote
                  mode-line-frame-identification
                  mode-line-buffer-identification
                  "  "
                  mode-line-position
                  (vc-mode vc-mode)
                  " "
                  mode-line-modes
                  " "
                  mode-line-misc-info
                  mode-line-end-spaces))

  (define-minor-mode prot/hidden-mode-line-mode
    "Toggle modeline visibility in the current buffer."
    :init-value nil
    :global nil
    (if prot/hidden-mode-line-mode
        (setq-local mode-line-format nil)
      (kill-local-variable 'mode-line-format)
      (force-mode-line-update))))


(use-package face-remap
  :diminish buffer-face-mode            ; the actual mode
  :commands prot/variable-pitch-mode
  :config
  (define-minor-mode prot/variable-pitch-mode
    "Toggle `variable-pitch-mode', except for `prog-mode'."
    :init-value nil
    :global nil
    (if prot/variable-pitch-mode
        (unless (derived-mode-p 'prog-mode)
          (variable-pitch-mode 1))
      (variable-pitch-mode -1))))


(use-package emacs
  :config
  (setq-default scroll-preserve-screen-position t)
  (setq-default scroll-conservatively 1) ; affects `scroll-step'
  (setq-default scroll-margin 0)

  (define-minor-mode prot/scroll-centre-cursor-mode
    "Toggle centred cursor scrolling behaviour."
    :init-value nil
    :lighter " S="
    :global nil
    (if prot/scroll-centre-cursor-mode
        (setq-local scroll-margin (* (frame-height) 2)
                    scroll-conservatively 0
                    maximum-scroll-margin 0.5)
      (dolist (local '(scroll-preserve-screen-position
                       scroll-conservatively
                       maximum-scroll-margin
                       scroll-margin))
        (kill-local-variable `,local))))

  ;; C-c l is used for `org-store-link'.  The mnemonic for this is to
  ;; focus the Line and also works as a variant of C-l.
  :bind ("C-c L" . prot/scroll-centre-cursor-mode))


(use-package display-line-numbers
  :defer
  :config
  ;; Set absolute line numbers.  A value of "relative" is also useful.
  (setq display-line-numbers-type t)

  (define-minor-mode prot/display-line-numbers-mode
    "Toggle `display-line-numbers-mode' and `hl-line-mode'."
    :init-value nil
    :global nil
    (if prot/display-line-numbers-mode
        (progn
          (display-line-numbers-mode 1)
          (hl-line-mode 1))
      (display-line-numbers-mode -1)
      (hl-line-mode -1)))
  :bind ("<f7>" . prot/display-line-numbers-mode))


(use-package frame
  :commands prot/cursor-type-mode
  :config
  (setq-default cursor-type 'box)
  (setq-default cursor-in-non-selected-windows '(bar . 2))
  (setq-default blink-cursor-blinks 50)
  (setq-default blink-cursor-interval nil) ; 0.75 would be my choice
  (setq-default blink-cursor-delay 0.2)

  (blink-cursor-mode -1)

  (define-minor-mode prot/cursor-type-mode
    "Toggle between static block and pulsing bar cursor."
    :init-value nil
    :global t
    (if prot/cursor-type-mode
        (progn
          (setq-local blink-cursor-interval 0.75
                      cursor-type '(bar . 2)
                      cursor-in-non-selected-windows 'hollow)
          (blink-cursor-mode 1))
      (dolist (local '(blink-cursor-interval
                       cursor-type
                       cursor-in-non-selected-windows))
        (kill-local-variable `,local))
      (blink-cursor-mode -1))))

;; ---------------------- MIXED PITCH -----------------
(use-package mixed-pitch
  :ensure (:host github
	   :repo "emacsmirror/mixed-pitch")
  :config
  ;; (dolist (face '(line-number org-property-value org-drawer
  ;;                 error org-cite corfu-current corfu-default
  ;;                 org-meta-line org-tag))
  ;;   (add-to-list 'mixed-pitch-fixed-pitch-faces face))
  (setq mixed-pitch-set-height 150)
  (defun my/mixed-pitch-spacing ()
    (if mixed-pitch-mode
        (setq line-spacing 0.12)
      (setq line-spacing 0.0))))
;; ----------------------------------------------------


;; --------- For org and latex major modes -------
;; inkscape + latex support
;; to be used in org and LaTeX major modes 
;; >>>
(use-package ink
  :ensure(:host github
	  :repo "Niraj-apr4/ink"))
;; <<<
;; --------------------------------------------

(add-hook 'text-mode-hook 'prot/olivetti-mode)

(provide 'setup-text-modes)
