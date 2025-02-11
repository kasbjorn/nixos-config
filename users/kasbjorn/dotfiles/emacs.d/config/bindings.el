(global-set-key [f8] 'neotree-toggle)


(defun pmi/named-term (term-name)
    "Generate a terminal with buffer name TERM-NAME."
    (interactive "sTerminal purpose: ")
    (vterm (concat "term-" term-name)))

(global-set-key [F8] 'neotree-toggle)

(global-set-key (kbd "M-<return>") 'pmi/named-term)
