(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))

(when (display-graphic-p)
  (require 'all-the-icons))

(require 'powerline)
(powerline-default-theme)

(load-theme 'nord t)
