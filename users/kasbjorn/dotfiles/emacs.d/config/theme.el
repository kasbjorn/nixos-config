(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))

(when (display-graphic-p)
  (require 'all-the-icons))

(use-package doom-modeline
  :ensure t
  :init
  (setq doom-modeline-height 25)
  (setq doom-modeline-project-detection 'auto)
  (doom-modeline-mode 1))

(load-theme 'nord t)
