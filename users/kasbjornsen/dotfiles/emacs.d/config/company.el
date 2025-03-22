(use-package company
  :ensure t
  :hook
  (lisp-mode . company-mode)
  :config
  (add-to-list 'company-backends '(company-yasnippet
				   company-capf)))
