
;; setup-windows.el

(use-package window
  :custom
  (display-buffer-alist
   '(("\\*Python\\*"
      (display-buffer-in-side-window)
      (window-width . 0.45)
      (side . right)
      (slot . -1))
    ("\\*gud-pdb\\*"
      (display-buffer-in-side-window)
      (window-height . 0.45)
      (side . bottom)
      (slot . -1)))))
   
;;TODO reftex to open in side windows 
;; >>> sample >>
;; ("\\*RefTex" (display-buffer-in-side-window)
;;          (window-height . 0.25)
;;          (side . bottom)
;;          (slot . -9)
;;          ;; (preserve-size . (nil . t))
;;          ;; (window-parameters . (;; (mode-line-format . (:eval (my/helper-window-mode-line-format)))
;;          ;;                       ))
;;          )
;; <<< sample <<<
(provide 'setup-windows)
