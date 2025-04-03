(when (member "Fira Code" (font-family-list))
  (set-face-attribute 'default nil :font "Fira Code" :height 108)
  (set-face-attribute 'fixed-pitch nil :family "Fira Code"))

(when (member "Source Sans Pro" (font-family-list))
  (set-face-attribute 'variable-pitch nil :family "Source Sans Pro" :height 1.18))

(when (display-graphic-p)
  (require 'all-the-icons))

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1))

(setq tab-bar-show 1
      tab-bar-close-button-show nil
      tab-bar-new-tab-choice "*scratch*"
      tab-bar-tab-hints t
      tab-bar-format '(tab-bar-format-tabs tab-bar-seperator))

(set-face-attribute 'tab-bar-tab nil :inherit 'doom-modeline-panel :foreground nil :background nil)

(load-theme 'nord t)
