(global-set-key [f8] 'treemacs)


(defun my/named-term (term-name)
    "Generate a terminal with buffer name TERM-NAME."
    (interactive "sTerminal purpose: ")
    (vterm (concat "term-" term-name)))

(global-set-key (kbd "M-<return>") 'my/named-term)
