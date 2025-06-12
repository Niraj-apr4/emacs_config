
;; setup-windows.el

(use-package window
  :config
  (setq display-buffer-alist
      '(("^\\*julia\\*"
	 (display-buffer-in-direction)
	 (direction . right)
         (body-function . select-window)
         (window-height . .35)
         (window-width .  .50)
         ;; (preserve-size . (nil . t))
         (direction . below)
         (side . bottom)
         (slot . 1))))

  (add-to-list 'display-buffer-alist
	       '("^\\*python\\*"
	       (display-buffer-in-direction)
	       (direction . right)
               (body-function . select-window)
               (window-height . .35)
               (window-width .  .50)
         ;; (preserve-size . (nil . t))
               (direction . below)
               (side . bottom)
               (slot . 1))))


(provide 'setup-windows)
