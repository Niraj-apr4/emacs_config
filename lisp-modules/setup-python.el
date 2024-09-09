;; niraj-python.el
;; settings for python programming 

(use-package python
  :config
  ;; setup up micromamba env binaries in python-shell-exec-path
  (setq python-shell-exec-path '("~/micromamba/envs/pythonEnv/bin") )
  ;; setup ipython as default interpreter
  (setq python-shell-interpreter "ipython3")
  (setq python-shell-interpreter-args "--simple-prompt")
  ;; TODO check what this line below does 
  (setq python-shell-extra-pythonpaths '("~/micromamba/envs/pythonEnv/lib/python3.11/site-packages")))
  
(provide 'setup-python)
