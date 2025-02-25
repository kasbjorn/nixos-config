(use-package treemacs
  :ensure t
  :bind
  ("[f8]" . treemacs))

(use-package treemacs-projectile
  :ensure t)

(use-package treemacs-nerd-icons
  :after treemacs
  :config
  (treemacs-load-theme "nerd-icons"))

