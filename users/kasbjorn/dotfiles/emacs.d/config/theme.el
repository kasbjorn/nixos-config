(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))

(when (display-graphic-p)
  (require 'all-the-icons))

(use-package doom-modeline
  :ensure t
  :init
  (setq doom-modeline-height 25)
  (setq doom-modeline-project-detection 'auto)
  (doom-modeline-mode 1))

(setq tab-bar-show 1
      tab-bar-close-button-show nil
      tab-bar-new-tab-choice "*scratch*"
      tab-bar-tab-hints t
      tab-bar-format '(tab-bar-format-tabs tab-bar-seperator))

(set-face-attribute 'tab-bar-tab nil :inherit 'doom-modeline-panel :foreground nil :background nil)

(load-theme 'nord t)
