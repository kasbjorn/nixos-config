(load "~/.emacs.d/config/packages")
(load "~/.emacs.d/config/theme")
(load "~/.emacs.d/config/org-mode")
(load "~/.emacs.d/config/bindings")
(load "~/.emacs.d/config/emms")
(load "~/.emacs.d/config/erc")
(load "~/.emacs.d/config/elfeed")
(load "~/.emacs.d/config/snippets")
(load "~/.emacs.d/config/mail")

;; Basic initialization
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(fset 'menu-bar-open nil)

(setq warning-minimum-level :emergency)

;; Fonts
(set-frame-font "FiraCode 10" nil t)

(setq inhibit-splash-screen t
      initial-major-mode 'org-mode
      initial-scratch-message "")


