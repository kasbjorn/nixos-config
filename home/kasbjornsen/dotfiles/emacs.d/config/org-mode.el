(use-package org
  :ensure t
  :config
  (setq org-startup-with-latex-preview t)
  (setq org-startup-folded 'content)
  (setq org-startup-with-inline-images t)
  (setq org-tags-column -80)
  (setq org-adapt-indentation t
      org-hide-leading-stars t
      org-pretty-entities t
      org-ellipsis "  ·")
  (setq org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0)
  (setq org-log-done                       t
      org-auto-align-tags                t
      org-fold-catch-invisible-edits     'show-and-error
      org-special-ctrl-a/e               t
      org-insert-heading-respect-content t)
  (plist-put org-format-latex-options :scale 1.35)
  (custom-set-faces
   '(org-document-title ((t (:height 1.6))))
   '(outline-1          ((t (:height 1.25))))
   '(outline-2          ((t (:height 1.2))))
   '(outline-3          ((t (:height 1.15))))
   '(outline-4          ((t (:height 1.1))))
   '(outline-5          ((t (:height 1.1))))
   '(outline-6          ((t (:height 1.1))))
   '(outline-8          ((t (:height 1.1))))
   '(outline-9          ((t (:height 1.1))))))
 
(use-package org-appear
  :commands (org-appear-mode)
  :hook     (org-mode . org-appear-mode)
  :config 
  (setq org-hide-emphasis-markers t)  ;; Must be activated for org-appear to work
  (setq org-appear-autoemphasis   t   ;; Show bold, italics, verbatim, etc.
        org-appear-autolinks      t   ;; Show links
        org-appear-autosubmarkers t)) ;; Show sub- and superscripts

(use-package org-superstar
  :after org
  :config
  (setq org-superstar-leading-bullet " ")
  (setq org-superstar-headline-bullets-list '("◆" "◇" "•" "⚬" "●" "○"))
  (setq org-superstar-special-todo-items t) ;; Makes TODO header bullets into boxes
  (setq org-superstar-todo-bullet-alist '(("TODO"  . 9744)
                                          ("PROG"  . 9744)
                                          ("NEXT"  . 9744)
                                          ("WAIT"  . 9744)
                                          ("DONE"  . 9745)))
  :hook (org-mode . org-superstar-mode))




