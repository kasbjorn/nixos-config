(global-set-key [f8] 'treemacs)


(defun pmi/named-term (term-name)
    "Generate a terminal with buffer name TERM-NAME."
    (interactive "Terminal purpose: ")
    (vterm (concat "term-" term-name)))

(global-set-key (kbd "M-<return>") 'pmi/named-term)
