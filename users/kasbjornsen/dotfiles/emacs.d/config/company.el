(use-package company
  :ensure t
  :hook
  (lisp-mode . company-mode)
  :config
  (setq company-backends '(company-caph
			   company-yasnippet)))
