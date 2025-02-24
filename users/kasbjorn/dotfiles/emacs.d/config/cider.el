;; Cider configuration

(use-package cider
  :ensure t
  :init
  (setq nrepl-hide-special-buffers t
	cider-repl-pop-to-buffer-on-connect nil
	cider-popup-stacktraces nil
	cider-repl-popup-stacktraces t))
