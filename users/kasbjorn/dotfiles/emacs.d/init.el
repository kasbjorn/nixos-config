(load "~/.emacs.d/config/packages")
(load "~/.emacs.d/config/theme")
;;(load "~/.emacs.d/config/org-mode")
(load "~/.emacs.d/config/bindings")
(load "~/.emacs.d/config/emms")
(load "~/.emacs.d/config/erc")
(load "~/.emacs.d/config/elfeed")

(add-to-list 'load-path "./modules")

;; Basic initialization
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(fset 'menu-bar-open nil)

;; Fonts
;;(set-frame-font "FiraCode 10" nil t)

(setq inhibit-splash-screen t
      initial-major-mode 'org-mode
      initial-scratch-message "")

(when window-system
  (fringe-mode 0))

(when window-system
  (or standard-display-table
      (setq standard-display-table (make-display-table)))
  (set-display-table-slot standard-display-table 0 ?\ ))

(setq mode-line-in-non-selected-windows nil)

