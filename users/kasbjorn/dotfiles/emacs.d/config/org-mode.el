(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
