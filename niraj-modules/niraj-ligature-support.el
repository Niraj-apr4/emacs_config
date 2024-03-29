;; ligature-support.el
;; enables ligatures 

(use-package ligature
  :ensure t
  :config
    ;; Enable the www ligature in every possible major mode
    (ligature-set-ligatures 't '("www"))

    ;; Enable ligatures in programming modes                                                           
    (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
					":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
					"-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
					"#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
					"/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
					"++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
					"=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
					"<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
					"<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
					"<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

    (global-ligature-mode 't))

(provide 'niraj-ligature-support)
