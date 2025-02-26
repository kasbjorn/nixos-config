(load "~/.emacs.d/config/packages")
(load "~/.emacs.d/config/theme")
(load "~/.emacs.d/config/org-mode")
(load "~/.emacs.d/config/bindings")
(load "~/.emacs.d/config/emms")
(load "~/.emacs.d/config/erc")
(load "~/.emacs.d/config/mail")
(load "~/.emacs.d/config/lsp")
(load "~/.emacs.d/config/treemacs")

(setq inferior-lisp-program "sbcl")

(setq warning-minimum-level :emergency)

;; Fonts
(set-frame-font "FiraCode 10" nil t)

(setq inhibit-splash-screen t
      initial-major-mode 'org-mode
      initial-scratch-message "")

(setq visible-bell t)

(when (window-system)
  (tool-bar-mode -1)
  (tooltip-mode -1)
  (scroll-bar-mode -1)
  (menu-bar-mode -1)
  (fset 'menu-bar-open nil))
