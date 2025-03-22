(use-package treemacs
  :ensure t
  :bind
  ("[f8]" . treemacs))

(use-package treemacs-projectile
  :ensure t)

(use-package treemacs-nerd-icons
  :ensure t
  :after treemacs)

(use-package treemacs-magit
  :ensure t)

(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

(lsp-treemacs-sync-mode 1)
