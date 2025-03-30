(load "~/.emacs.d/config/packages")
(load "~/.emacs.d/config/theme")
(load "~/.emacs.d/config/org-mode")
(load "~/.emacs.d/config/bindings")
(load "~/.emacs.d/config/emms")
(load "~/.emacs.d/config/erc")
(load "~/.emacs.d/config/treemacs")
(load "~/.emacs.d/config/publish")
(load "~/.emacs.d/config/theme")
(load "~/.emacs.d/config/mail")
(load "~/.emacs.d/config/lsp")
;;(load "~/.emacs.d/config/company")
(load "~/.emacs.d/config/custom")

(setq inferior-lisp-program "/home/kasbjornsen/.nix-profile/bin/sbcl")
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
  (fset 'menu-bar-open nil)
  (tab-bar-mode 1))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:height 1.6))))
 '(outline-1 ((t (:height 1.25))))
 '(outline-2 ((t (:height 1.2))))
 '(outline-3 ((t (:height 1.15))))
 '(outline-4 ((t (:height 1.1))))
 '(outline-5 ((t (:height 1.1))))
 '(outline-6 ((t (:height 1.1))))
 '(outline-8 ((t (:height 1.1))))
 '(outline-9 ((t (:height 1.1)))))

;; Misc
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'text-mode-hook 'my/display-line-numbers)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/Documents/orgs/personal.org"))
 '(package-selected-packages
   '(compay-yasnippet mu4e ement yasnippet-capf vterm treemacs-projectile treemacs-persp treemacs-nerd-icons treemacs-magit svg-tag-mode sly rust-mode rainbow-delimiters paredit org-superstar org-appear olivetti nord-theme nix-mode mastodon lsp-ui lsp-treemacs lsp-ivy ligature emojify emms doom-modeline company cider all-the-icons-nerd-fonts all-the-icons-completion))
 '(send-mail-function 'mailclient-send-it))
