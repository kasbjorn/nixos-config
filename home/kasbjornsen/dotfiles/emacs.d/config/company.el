(use-package company
  :ensure t
  :hook
  ((lisp-mode
    sly-mode
    cider-mode
    nix-mode
    ) . company-mode)
  :config
  (add-to-list 'company-backends '(company-capf
				   company-yasnippet)))
