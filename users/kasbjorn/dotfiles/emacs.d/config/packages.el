(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)

(add-to-list 'load-path '("~/.emacs.d/git/geiser/elisp"))
(add-to-list 'load-path '("~/.emacs.d/git/geiser-guile"))

(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(eval-when-compile
  (require 'use-package)
  (require 'use-package-ensure)
  (setq use-package-always-ensure t))

(use-package cider
  :ensure t)

(use-package powerline
	     :ensure t)

(use-package emms
  :ensure t
  :config
  (emms-standard)
  (emms-default-players)


(use-package vterm
  :ensure t)

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package neotree
  :ensure t)

(use-package magit
  :ensure t)

(use-package ivy
  :ensure t)

(use-package geiser-guile
  :ensure t)

(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/Projects/" "~/Playground"))
  :config
  ;; I typically use this keymap prefix on macOS
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  ;; On Linux, however, I usually go with another one
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (global-set-key (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package perspective
  :bind
  ("C-x C-b" . ivy-switch-buffer)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-z"))  ; pick your own prefix key here
  :init
  (persp-mode))

