(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))

(when (display-graphic-p)
  (require 'all-the-icons))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(load-theme 'nord t)
