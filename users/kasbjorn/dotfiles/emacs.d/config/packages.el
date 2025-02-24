(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)


(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(eval-when-compile
  (require 'use-package)
  (require 'use-package-ensure)
  (setq use-package-always-ensure t))

(use-package mastodon
    :ensure t
    :config
    (mastodon-discover)
    (setq mastodon-instance-url "https://mstdn.social"
	  mastodon-active-user "praetor207@gmail.com"))

(use-package auth-source
  :ensure t)

(use-package cider
  :ensure t)

(use-package erc-image
  :ensure t
  :after erc
  :config
  (setq erc-image-inline-rescale 300)
  (setq erc-prompt-for-password nil)
  (add-to-list 'erc-modules 'image))

(use-package emojify
  :ensure t
  :hook (erc-mode . emojify-mode)
  :commands emojify-mode)

(use-package emms
      :ensure t
      :init
      (add-hook 'emms-player-started-hook 'emms-show)
      :config
      (setq emms-show-format "Playing: %s")
      (setq emms-source-file-default-directory "~/Music/"
      (emms-all)
      (emms-default-players))

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

(use-package yasnippet
  :ensure t
  :hook
  ((text-mode
    prog-mode
    conf-mode
    snippet-mode) . yas-minor-mode-on)
  :init
  (setq yas-snippet-dir "~/.emacs.d/snippets"))

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

