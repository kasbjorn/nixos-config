(use-package elfeed
  :ensure
  :bind
  ("C-c w e" . elfeed))

(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~.emacs.d/feeds.org")))
