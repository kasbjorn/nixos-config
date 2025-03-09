
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

(use-package nord-theme
    :ensure t)

;; Chat

;; Mastodon
(use-package mastodon
    :ensure t
    :config
    (mastodon-discover)
    (setq mastodon-instance-url "https://mstdn.social"
	  mastodon-active-user "praetor207@gmail.com"))

;; Utilities
(use-package paredit
  :ensure t)

(use-package rainbow-delimiters
  :ensure t)

;; LiveCode
(use-package sly
  :ensure t)

(use-package company
  :ensure t)

(use-package auth-source
  :ensure t)

(use-package all-the-icons
  :ensure t)	

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
      (setq emms-source-file-default-directory "~/Music/")
      (emms-all)
      (emms-default-players))

(use-package vterm
  :ensure t)

(use-package magit
  :ensure t)

(use-package ivy
  :ensure t)

(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/Projects/" "~/Playground"))
  :config
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (global-set-key (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))
